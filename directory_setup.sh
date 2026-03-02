#!/bin/bash

cd src

mkdir config middleware modules prisma shared lib utils

mkdir modules/auth modules/user

touch config/db.mongo.ts config/db.postgres.ts config/.example.env

touch middleware/auth.middleware.ts middleware/error.middleware.ts \
    middleware/async.middleware.ts middleware/advancedResults.middleware.ts

touch prisma/schema.prisma

touch shared/errors.ts shared/jwt.ts shared/policy.ts shared/utils.ts

touch modules/auth/auth.controllers.ts modules/auth/auth.routes.ts \
    modules/auth/auth.service.ts modules/auth/auth.types.ts \
    modules/auth/auth.validation.ts

# duplicate this for each module
touch modules/user/user.controllers.ts modules/user/user.models.ts \
    modules/user/user.routes.ts modules/user/user.service.ts \
    modules/user/user.types.ts modules/user/user.validation.ts \
    modules/user/user.policy.ts modules/user/user.repository.ts


npm install typescript tsx @types/node --save-dev
npx tsc --init

# prisma setup
npm install prisma @types/node @types/pg --save-dev
npm install @prisma/client @prisma/adapter-pg pg dotenv

npx prisma init --datasource-provider postgresql --output ../src/generated/prisma 
npx prisma init --datasource-provider mongodb --output ../src/generated/prisma

npx prisma migrate dev --name init

npx prisma generate


