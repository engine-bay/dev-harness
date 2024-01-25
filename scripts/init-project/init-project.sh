#!/bin/bash


PROJECT_NAME=Challenges

MODULE_CORE=("core" "Core")
MODULE_PERSISTENCE=("persistence" "Persistence")
MODULE_DATA_PROTECTION=("data-protection" "DataProtection")
MODULE_API_DOCUMENTATION=("api-documentation" "ApiDocumentation")
MODULE_AUDITING=("auditing" "Auditing")
MODULE_AUTHENTICATION=("authentication" "Authentication")
MODULE_CORS=("cors" "Cors")
MODULE_DATABASE_MANAGEMENT=("database-management" "DatabaseManagement")
MODULE_DOCUMENTATION_PORTAL=("documentation-portal" "DocumentationPortal")
MODULE_LOGGING=("logging" "Logging")
MODULE_RATE_LIMITING=("rate-limiting" "RateLimiting")
MODULE_DEMO_MODULE=("demo-module" "DemoModule")
MODULE_DEMO_API=("demo-api" "DemoApi")

MODULES=(MODULE_CORE MODULE_PERSISTENCE MODULE_DATA_PROTECTION MODULE_API_DOCUMENTATION MODULE_AUDITING MODULE_AUTHENTICATION MODULE_CORS MODULE_DATABASE_MANAGEMENT MODULE_DOCUMENTATION_PORTAL MODULE_LOGGING MODULE_RATE_LIMITING MODULE_DEMO_MODULE MODULE_DEMO_API)
MAIN_MODULE=$MODULE_DEMO_API

WORKING_DIRECTORY=$PWD
PROJECT_FOLDER="${PROJECT_NAME,,}"
PROJECT_ROOT="$WORKING_DIRECTORY/$PROJECT_FOLDER"
SOLUTION_NAME=$PROJECT_NAME

echo
echo ================================================================================================
echo Step 1: Prepare the working directory
echo ================================================================================================

echo Clean up the working folders
if [[ -d "$PROJECT_FOLDER" ]];
then
    echo
    echo WARNING: THIS CANNOT BE UNDONE
    echo The project folder already exists.
    echo Continuing will remove all files and folders in $PROJECT_ROOT
    echo WARNING: THIS CANNOT BE UNDONE
    echo
    read -p "Would you like to purge all data in $PROJECT_ROOT (y/n)" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo Purging $PROJECT_ROOT
        rm -rf $PROJECT_FOLDER
    else
        echo The folder already exists, running this script can have unintended consequences.
        echo Review and remove the folder before running this script again.
        exit 0
    fi
fi
echo ----

echo Pull the EngineBay git repository

# Delete the "dev-harness" folder to pull a new copy of the repo
if [[ ! -d "$WORKING_DIRECTORY/dev-harness" ]];
then
    echo Cloning the git repository
    git clone git@github.com:engine-bay/dev-harness.git --recursive
else
    echo Do nothing: Repository exists
fi

echo
echo ================================================================================================
echo Step 2: Copy and set up new project files
echo ================================================================================================

echo Create the project folder: $PROJECT_FOLDER

mkdir -v $PROJECT_FOLDER
echo ----

echo Copy metadata files to the project folder

cp --recursive dev-harness/.config $PROJECT_FOLDER/.config
cp dev-harness/.gitignore $PROJECT_FOLDER/.gitignore
cp dev-harness/LICENSE $PROJECT_FOLDER/LICENSE.txt
cp dev-harness/README.md $PROJECT_FOLDER/README.md

cp dev-harness/${MAIN_MODULE[0]}/.dockerignore $PROJECT_FOLDER/.dockerignore
cp dev-harness/${MAIN_MODULE[0]}/.editorconfig $PROJECT_FOLDER/.editorconfig
cp dev-harness/${MAIN_MODULE[0]}/.env $PROJECT_FOLDER/.env
cp dev-harness/${MAIN_MODULE[0]}/Dockerfile $PROJECT_FOLDER/.Dockerfile
echo ----

echo Copy the registered modules
declare -n module
for module in "${MODULES[@]}"; do
    echo "Copy module: EngineBay.${module[1]} to $PROJECT_NAME.${module[1]}"
    cp --recursive dev-harness/${module[0]}/EngineBay.${module[1]} $PROJECT_FOLDER/$PROJECT_NAME.${module[1]}
    cp --recursive dev-harness/${module[0]}/EngineBay.${module[1]}.Tests $PROJECT_FOLDER/$PROJECT_NAME.${module[1]}.Tests
    cp dev-harness/${module[0]}/README.md $PROJECT_FOLDER/$PROJECT_NAME.${module[1]}/README.md
done
echo ----

echo Move seed data

mkdir -v $PROJECT_FOLDER/$PROJECT_NAME.Authentication/seed-data/
mv -v $PROJECT_FOLDER/$PROJECT_NAME.DemoApi/SeedData/* $PROJECT_FOLDER/$PROJECT_NAME.Authentication/seed-data/
echo ----

echo Replace ModuleRegistration.cs

cp ModuleRegistration.cs $PROJECT_FOLDER/$PROJECT_NAME.DemoApi/Modules/ModuleRegistration.cs
echo ----

echo Replace .env

cp .env $PROJECT_FOLDER/.env
echo ----

echo Copy Dockerfile

cp Dockerfile $PROJECT_FOLDER/Dockerfile
echo ----

echo Remove unused files from the documentation portal

DOCUMENTATION_ROOT=$PROJECT_FOLDER/$PROJECT_NAME.DocumentationPortal/DocumentationPortal/docs

rm -rf $DOCUMENTATION_ROOT/documentation/concepts
rm -f $DOCUMENTATION_ROOT/about/architecture-decision-records/actor-model.md $DOCUMENTATION_ROOT/about/architecture-decision-records/expression-engine.md $DOCUMENTATION_ROOT/about/architecture-decision-records/proto-actor.md
rm -f $DOCUMENTATION_ROOT/documentation/modules/index.md  $DOCUMENTATION_ROOT/documentation/modules/actor-engine.md $DOCUMENTATION_ROOT/documentation/modules/blueprints.md $DOCUMENTATION_ROOT/documentation/modules/module-template.md $DOCUMENTATION_ROOT/documentation/modules/sheet-functions.md
echo ----

echo Copy files needed for the vs code dev experience

cp --recursive dev-harness/${MAIN_MODULE[0]}/.vscode $PROJECT_FOLDER/.vscode
cp ./$PROJECT_FOLDER.code-workspace $PROJECT_FOLDER/$PROJECT_FOLDER.code-workspace

echo
echo ================================================================================================
echo Step 3: Rename project files and folders
echo ================================================================================================

echo Rename csproj files from EngineBay to $PROJECT_NAME

cd $PROJECT_FOLDER
declare -n module
for module in "${MODULES[@]}"; do

    EB_PROJECT=EngineBay.${module[1]}
    MODULE_PROJECT=$PROJECT_NAME.${module[1]}

    echo "Rename module: $EB_PROJECT > $MODULE_PROJECT"
    cd $MODULE_PROJECT
    mv $EB_PROJECT.csproj $MODULE_PROJECT.csproj
    cd ../$MODULE_PROJECT.Tests
    mv $EB_PROJECT.Tests.csproj $MODULE_PROJECT.Tests.csproj
    cd ..
done
echo ----

echo Rename DemoApi to API

cd $WORKING_DIRECTORY
mv $PROJECT_FOLDER/$PROJECT_NAME.DemoApi/Modules/DemoApiModule.cs $PROJECT_FOLDER/$PROJECT_NAME.DemoApi/Modules/ApiModule.cs
mv $PROJECT_FOLDER/$PROJECT_NAME.DemoApi/$PROJECT_NAME.DemoApi.csproj $PROJECT_FOLDER/$PROJECT_NAME.DemoApi/$PROJECT_NAME.Api.csproj
mv $PROJECT_FOLDER/$PROJECT_NAME.DemoApi.Tests/$PROJECT_NAME.DemoApi.Tests.csproj $PROJECT_FOLDER/$PROJECT_NAME.DemoApi.Tests/$PROJECT_NAME.Api.Tests.csproj
mv $PROJECT_FOLDER/$PROJECT_NAME.DemoApi $PROJECT_FOLDER/$PROJECT_NAME.Api
mv $PROJECT_FOLDER/$PROJECT_NAME.DemoApi.Tests $PROJECT_FOLDER/$PROJECT_NAME.Api.Tests
cd $WORKING_DIRECTORY
echo ----


echo "Replace occurences of 'EngineBay' with '$PROJECT_NAME'"

find ./$PROJECT_FOLDER/ -type f -exec sed -i s/EngineBay/$PROJECT_NAME/g {} \;
find ./$PROJECT_FOLDER/ -type f -exec sed -i s/engineBay/$PROJECT_FOLDER/g {} \;
echo ----

echo "Replace occurences of 'DemoApi' with 'Api'"

find ./$PROJECT_FOLDER/ -type f -exec sed -i s/DemoApi/Api/g {} \;
echo ----

echo Fix the project references in the csproj

find ./$PROJECT_FOLDER/ -type f -name "*.csproj" -exec sed -i '/<Choose>/d' {} \;
find ./$PROJECT_FOLDER/ -type f -name "*.csproj" -exec sed -i '/<\/Choose>/d' {} \;
find ./$PROJECT_FOLDER/ -type f -name "*.csproj" -exec sed -i '/<When/d' {} \;
find ./$PROJECT_FOLDER/ -type f -name "*.csproj" -exec sed -i '/<\/When/d' {} \;
find ./$PROJECT_FOLDER/ -type f -name "*.csproj" -exec sed -i '/<Otherwise>/d' {} \;
find ./$PROJECT_FOLDER/ -type f -name "*.csproj" -exec sed -i '/<\/Otherwise>/d' {} \;
find ./$PROJECT_FOLDER/ -type f -name "*.csproj" -exec sed -i "/PackageReference Include=\"$PROJECT_NAME/d" {} \;

for module in "${MODULES[@]}"; do
    find ./$PROJECT_FOLDER/ -type f -name "*.csproj" -exec sed -i "s#Include=\"..\/..\/${module[0]}[\/\\]#Include=\"..\/#g" {} \;
done
echo ----

echo Remove nuget properties in project files

find ./$PROJECT_FOLDER/ -name "*.csproj" -type f -exec sed -i '/<PackageProjectUrl>/d' {} \;
find ./$PROJECT_FOLDER/ -name "*.csproj" -type f -exec sed -i '/<RepositoryUrl>/d' {} \;
find ./$PROJECT_FOLDER/ -name "*.csproj" -type f -exec sed -i '/<PackageId>/d' {} \;
find ./$PROJECT_FOLDER/ -name "*.csproj" -type f -exec sed -i '/<Version>/d' {} \;
find ./$PROJECT_FOLDER/ -name "*.csproj" -type f -exec sed -i '/<Authors>/d' {} \;
find ./$PROJECT_FOLDER/ -name "*.csproj" -type f -exec sed -i '/<Company>/d' {} \;
find ./$PROJECT_FOLDER/ -name "*.csproj" -type f -exec sed -i '/<GeneratePackageOnBuild>/d' {} \;
find ./$PROJECT_FOLDER/ -name "*.csproj" -type f -exec sed -i '/<PackageReadmeFile>/d' {} \;
find ./$PROJECT_FOLDER/ -name "*.csproj" -type f -exec sed -i '/<PackageLicenseFile>/d' {} \;
echo ----

echo Clean up the readme files

find ./$PROJECT_FOLDER/ -type f -name "*.md" -exec sed -i '/\[!\[NuGet version\]/d' {} \;
find ./$PROJECT_FOLDER/ -type f -name "*.md" -exec sed -i '/\[!\[Maintainability\]/d' {} \;
find ./$PROJECT_FOLDER/ -type f -name "*.md" -exec sed -i '/\[!\[Test Coverage\]/d' {} \;

echo
echo ================================================================================================
echo Step 4: Create a new solution
echo ================================================================================================

cd $PROJECT_FOLDER

echo Create $SOLUTION_NAME.sln
dotnet new sln --name $SOLUTION_NAME
echo ----

echo Add all csproj files to the solution
dotnet sln add **/*.csproj
echo ----

echo Add the DocumentationPortal refernence to Api
dotnet add $PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj reference $PROJECT_NAME.DocumentationPortal/$PROJECT_NAME.DocumentationPortal.csproj

echo
echo ================================================================================================
echo Step 5: Build and test
echo ================================================================================================

cd $WORKING_DIRECTORY/$PROJECT_FOLDER
# dotnet build
# dotnet test --no-build
code $PROJECT_FOLDER.code-workspace