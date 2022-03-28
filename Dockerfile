FROM node:14.15.4
WORKDIR /app
RUN apt update \
  && npm install -g @angular/cli@11
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 4200
ENTRYPOINT [ "ng", "s", "--host", "0.0.0.0", "--poll" ]
# --host 0.0.0.0 allows the connection between the container and localhost:4200 local
# --poll enable hot reload in ms from angular in container to localhost 
# initializing by vscode the ENTRYPOINT don't execute, then execute the command in terminal ng s --host 0.0.0.0 --poll