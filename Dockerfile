FROM node:lts

RUN apt-get update
RUN apt-get install -y git ffmpeg wget gnupg --no-install-recommends

#Aggiunte dipendenze per chrome/puppetteer
#Forse si può togliere qualcosa, ma non so cosa
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/SalScotto/destreamer

#Node è viziato
RUN chown node ./destreamer/
USER node
WORKDIR /destreamer

RUN npm install
RUN npm run build

ENTRYPOINT ["./destreamer.sh"]