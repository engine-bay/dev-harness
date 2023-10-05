# EngineBay Community Edition

[![Maintainability](https://api.codeclimate.com/v1/badges/0dd1667750eed82bf5e9/maintainability)](https://codeclimate.com/github/engine-bay/engine-bay-ce/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/0dd1667750eed82bf5e9/test_coverage)](https://codeclimate.com/github/engine-bay/engine-bay-ce/test_coverage)

## About

This is the community edition of EngineBay.

## Related packages

* [EngineBay.ActorEngine](https://github.com/engine-bay/actor-engine)
* [EngineBay.ApiDocumentation](https://github.com/engine-bay/api-documentation)
* [EngineBay.Authentication](https://github.com/engine-bay/authentication)
* [EngineBay.Blueprints](https://github.com/engine-bay/blueprints)
* [EngineBay.Core](https://github.com/engine-bay/core)
* [EngineBay.Cors](https://github.com/engine-bay/cors)
* [EngineBay.DatabaseManagement](https://github.com/engine-bay/database-management)
* [EngineBay.Logging](https://github.com/engine-bay/logging)
* [EngineBay.Persistence](https://github.com/engine-bay/persistence)
* [EngineBay.SheetFunctions](https://github.com/engine-bay/sheet-functions)
* [EngineBay.Telemetry](https://github.com/engine-bay/telemetry)



git submodule add git@github.com:engine-bay/actor-engine.git actor-engine
git submodule add git@github.com:engine-bay/admin-portal.git admin-portal
git submodule add git@github.com:engine-bay/api-documentation.git api-documentation
git submodule add git@github.com:engine-bay/authentication.git authentication
git submodule add git@github.com:engine-bay/blueprints.git blueprints
git submodule add git@github.com:engine-bay/core.git core
git submodule add git@github.com:engine-bay/cors.git cors
git submodule add git@github.com:engine-bay/data-protection.git data-protection
git submodule add git@github.com:engine-bay/database-management.git database-management
git submodule add git@github.com:engine-bay/demo-module.git demo-module
git submodule add git@github.com:engine-bay/documentation-portal.git documentation-portal
git submodule add git@github.com:engine-bay/engine-bay-ce.git engine-bay-ce
git submodule add git@github.com:engine-bay/logging.git logging
git submodule add git@github.com:engine-bay/module-template.git module-template
git submodule add git@github.com:engine-bay/persistence.git persistence
git submodule add git@github.com:engine-bay/sheet-functions.git sheet-functions
git submodule add git@github.com:engine-bay/telemetry.git telemetry


dotnet sln add "actor-engine/EngineBay.ActorEngine/EngineBay.ActorEngine.csproj"
dotnet sln add "actor-engine/EngineBay.ActorEngine.Tests/EngineBay.ActorEngine.Tests.csproj"
dotnet sln add "admin-portal/EngineBay.AdminPortal/EngineBay.AdminPortal.csproj"
dotnet sln add "admin-portal/EngineBay.AdminPortal.Tests/EngineBay.AdminPortal.Tests.csproj"
dotnet sln add "api-documentation/EngineBay.ApiDocumentation/EngineBay.ApiDocumentation.csproj"
dotnet sln add "api-documentation/EngineBay.ApiDocumentation.Tests/EngineBay.ApiDocumentation.Tests.csproj"
dotnet sln add "authentication/EngineBay.Authentication/EngineBay.Authentication.csproj"
dotnet sln add "authentication/EngineBay.Authentication.Tests/EngineBay.Authentication.Tests.csproj"
dotnet sln add "blueprints/EngineBay.Blueprints/EngineBay.Blueprints.csproj"
dotnet sln add "blueprints/EngineBay.Blueprints.Tests/EngineBay.Blueprints.Tests.csproj"
dotnet sln add "core/EngineBay.Core/EngineBay.Core.csproj"
dotnet sln add "core/EngineBay.Core.Tests/EngineBay.Core.Tests.csproj"
dotnet sln add "cors/EngineBay.Cors/EngineBay.Cors.csproj"
dotnet sln add "cors/EngineBay.Cors.Tests/EngineBay.Cors.Tests.csproj"
dotnet sln add "data-protection/EngineBay.DataProtection/EngineBay.DataProtection.csproj"
dotnet sln add "data-protection/EngineBay.DataProtection.Tests/EngineBay.DataProtection.Tests.csproj"
dotnet sln add "database-management/EngineBay.DatabaseManagement/EngineBay.DatabaseManagement.csproj"
dotnet sln add "database-management/EngineBay.DatabaseManagement.Tests/EngineBay.DatabaseManagement.Tests.csproj"
dotnet sln add "demo-module/EngineBay.DemoModule/EngineBay.DemoModule.csproj"
dotnet sln add "demo-module/EngineBay.DemoModule.Tests/EngineBay.DemoModule.Tests.csproj"
dotnet sln add "documentation-portal/EngineBay.DocumentationPortal/EngineBay.DocumentationPortal.csproj"
dotnet sln add "documentation-portal/EngineBay.DocumentationPortal.Tests/EngineBay.DocumentationPortal.Tests.csproj"
dotnet sln add "engine-bay-ce/EngineBay.CommunityEdition/EngineBay.CommunityEdition.csproj"
dotnet sln add "engine-bay-ce/EngineBay.CommunityEdition.Tests/EngineBay.CommunityEdition.Tests.csproj"
dotnet sln add "logging/EngineBay.Logging/EngineBay.Logging.csproj"
dotnet sln add "logging/EngineBay.Logging.Tests/EngineBay.Logging.Tests.csproj"
dotnet sln add "module-template/EngineBay.ModuleTemplate/EngineBay.ModuleTemplate.csproj"
dotnet sln add "module-template/EngineBay.ModuleTemplate.Tests/EngineBay.ModuleTemplate.Tests.csproj"
dotnet sln add "persistence/EngineBay.Persistence/EngineBay.Persistence.csproj"
dotnet sln add "persistence/EngineBay.Persistence.Tests/EngineBay.Persistence.Tests.csproj"
dotnet sln add "sheet-functions/EngineBay.SheetFunctions/EngineBay.SheetFunctions.csproj"
dotnet sln add "sheet-functions/EngineBay.SheetFunctions.Tests/EngineBay.SheetFunctions.Tests.csproj"
dotnet sln add "telemetry/EngineBay.Telemetry/EngineBay.Telemetry.csproj"
dotnet sln add "telemetry/EngineBay.Telemetry.Tests/EngineBay.Telemetry.Tests.csproj"



dotnet add 'api/EngineBay.ApiDocumentation/EngineBay.ApiDocumentation.Dev.csproj' reference 'api-documentation/EngineBay.ApiDocumentation/EngineBay.ApiDocumentation.Dev.csproj'


dotnet sln add "api/EngineBay.DemoApi/EngineBay.DemoApi.csproj"
dotnet sln add "api/EngineBay.DemoApi.Tests/EngineBay.DemoApi.Tests.csproj"


git add .
git stash -m"-dev csproj"