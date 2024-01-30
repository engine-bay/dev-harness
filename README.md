# EngineBay dev harness

[![Maintainability](https://api.codeclimate.com/v1/badges/0dd1667750eed82bf5e9/maintainability)](https://codeclimate.com/github/engine-bay/engine-bay-ce/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/0dd1667750eed82bf5e9/test_coverage)](https://codeclimate.com/github/engine-bay/engine-bay-ce/test_coverage)

## About

Engine Bay is comprised of multiple repositories referenced via nuget packages. This structure does not work well for local development.

This repo tries to address this issue and provide a frictionless development harness for Engine Bay.

## How does it work.

This wraps all EngineBay repositories as sub modules and provides a solution file pulling in all the sub modules as projects. Each project file will then conditionally load dependency projects as project references instead of packages.

## Prerequisites

### Install

- [Node](https://nodejs.org/)
- [Python](https://www.python.org/)
- [Pip](https://pip.pypa.io/en/stable/installation/)


>   If you get an error on Windows that python or pip is not recognised or cannot run
>
> - Check that the python install location has been added to your PATH
> - Check that Windows Defender is not blocking Python and add it to your exclusion list if needed

### Environment Variables

- ASPNETCORE_ENVIRONMENT="Development"

  The projects in each repo by default uses nuget packages to reference other projects. When running in a development environment we switch to project references. This is so changes in one project will immediately reflect in another project without the need to push to Nuget first.

  Linux & Mac
  > Add the following line to your .bashrc or similar. This will set it for all terminals going forward, alternatively look into setting it up per terminal session.
  > ```
  > export ASPNETCORE_ENVIRONMENT="Development"
  > ```

  Windows
  > Run the following command
  > ```
  > setx ASPNETCORE_ENVIRONMENT Development
  > ```

## Getting started for local development

### Clone the repo

  ```
  git clone git@github.com:engine-bay/dev-harness.git --recursive
  ```

### Update the submodules
  ```
  git submodule foreach "git checkout main"
  ```

### VS Code

- Open the [engine-bay-dev-harness](./engine-bay-dev-harness.code-workspace) workspace
- Run the `Debug All (Demo API & Community Edition)` launch configuration

### Other IDEs

For Rider, Visual Studio and the CLI to configure your app settings in the launchsettings.json file. You can copy the environment variables for each of the projects
- [Demo API](./demo-api/.env)
- [Community Edition](./engine-bay-ce/.env)

## Running the Application

- Use [this startup script](./scripts/dev-server-up.sh) to start the applications in docker.
- Use [this teardown script](./scripts/dev-server-down.sh) to stop the applications in docker and remove the images.


## Scripts

- [Run the dev server](./scripts/dev-server-up.sh).
- [Stop the dev server](./scripts/dev-server-down.sh)
- [Run the server](./scripts/server-up.sh)
- [Stop the server](./scripts/server-down.sh)

## Also see

- [Demo API](./demo-api/README.md)
- [Community Edition](./engine-bay-ce/README.md)


## Related packages

- [EngineBay.ActorEngine](https://github.com/engine-bay/actor-engine)
- [EngineBay.AdminPortal](https://github.com/engine-bay/admin-portal)
- [EngineBay.ApiDocumentation](https://github.com/engine-bay/api-documentation)
- [EngineBay.Auditing](https://github.com/engine-bay/auditing)
- [EngineBay.Authentication](https://github.com/engine-bay/authentication)
- [EngineBay.Blueprints](https://github.com/engine-bay/blueprints)
- [EngineBay.Core](https://github.com/engine-bay/core)
- [EngineBay.Cors](https://github.com/engine-bay/cors)
- [EngineBay.DataProtection](https://github.com/engine-bay/data-protection)
- [EngineBay.DatabaseManagement](https://github.com/engine-bay/database-management)
- [EngineBay.DemoApi](https://github.com/engine-bay/demo-api)
- [EngineBay.DemoModule](https://github.com/engine-bay/demo-module)
- [EngineBay.DocumentationPortal](https://github.com/engine-bay/documentation-portal)
- [EngineBay.Logging](https://github.com/engine-bay/logging)
- [EngineBay.Persistence](https://github.com/engine-bay/persistence)
- [EngineBay.SheetFunctions](https://github.com/engine-bay/sheet-functions)
- [EngineBay.Telemetry](https://github.com/engine-bay/telemetry)