FROM node:17.8.0

# 作業ディレクトリ外にパッケージをインストールする
WORKDIR /usr/src
COPY package.json package-lock.json /usr/src
RUN npm install

# /node_modulesにパスを通す
ENV PATH $PATH:/usr/src/node_modules/.bin

# /usr/src/appを作業ディレクトリとする
WORKDIR /usr/src/app

# vueのアプリを含め、すべてのファイルをコピー 
COPY . ./

# 実行ユーザをnodeにする
USER node

# docker compose up時に実行する起動スクリプトを設定
CMD ["sh", "/usr/src/app/start.sh"]
