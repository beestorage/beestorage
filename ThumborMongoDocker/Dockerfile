FROM apsl/thumbor:latest
ENV LOADER thumbor_mongodb.loader
ENV MONGO_STORAGE_SERVER_HOST 192.168.137.166
ENV MONGO_STORAGE_SERVER_PORT 27017
ENV MONGO_STORAGE_SERVER_DB picture
ENV MONGO_STORAGE_SERVER_COLLECTION files
ENV UPLOAD_ENABLED True
ENV UPLOAD_PUT_ALLOWED True
ENV UPLOAD_PHOTO_STORAGE tc_mongodb.storages.mongo_storage
ENV UPLOAD_DEFAULT_FILENAME image
RUN pip install thumbor --upgrade
RUN pip install pymongo --upgrade
RUN pip install thumbor_hbase
RUN pip install tc_mongodb
RUN sh -c 'git clone -b Workwith_tc_mongodb https://github.com/lionants02/thumbor_mongodb.git /usr/src/app/thumbor_mongodb/'
RUN sh /usr/src/app/thumbor_mongodb/setup_mongodb.sh