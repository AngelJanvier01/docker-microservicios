from mongomock import MongoClient

class PyMongoMock(MongoClient):
    def init_app(self, app):
        return super().__init__()