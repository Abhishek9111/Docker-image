#baseImage-> containing node npm etc
FROM node:20-alpine 

WORKDIR /app
#copy from currentdirectory include node modules(unless excluded in docker ignore) to working directory of docker file
COPY . .

RUN npm install
RUN npm run build
RUN npx prisma generate

# ENV DATABASE_URL=""
EXPOSE 3000

#CODE ABOVE THIS LINE RUN WHEN IMAGE IS CREATED(bootstrap), BELOW THIS IS WHEN IMAGE IS STARTED
CMD ["node","dist/index.js"]