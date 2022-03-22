# strapi-next-ts-template

## Steps
1. Initialize yarn workspaces
    ```shell
    # set yarn version
    yarn set version berry
    # initialize yarn with workspaces
    yarn init -w
    # Change newly created `packages/` directory to `apps/`
    mv packages apps
    ```
    Open `package.json` change:
    ```
      "workspaces": [
        "apps/*"
    ]
    ```
2. Create Strapi API
3. Create Next.js Web app
