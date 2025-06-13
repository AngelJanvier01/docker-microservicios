import unittest
from unittest.mock import patch
from src.application import create_app
from . import PyMongoMock
import src.database

class TestClients(unittest.TestCase):

    def test_create_client(self):
        with patch.object(src.database, "db", PyMongoMock()):
            app = create_app("mongodb://localhost:27017/database_test").test_client()
            response = app.post("/clients")
            self.assertEqual(response.status_code, 201)

            response_json = response.get_json()
            self.assertTrue(isinstance(response_json, dict))

    def test_get_clients(self):
        with patch.object(src.database, "db", PyMongoMock()):
            app = create_app("mongodb://localhost:27017/database_test").test_client()
            response = app.get("/clients")
            self.assertEqual(response.status_code, 200)

            response_json = response.get_json()
            self.assertTrue(isinstance(response_json, list))