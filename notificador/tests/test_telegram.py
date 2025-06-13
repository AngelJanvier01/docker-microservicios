import unittest
from src.application import create_app

class TestTelegram(unittest.TestCase):

    def test_send_telegram(self):
        request = {
            "message": "test from bot"
        }

        app = create_app().test_client()
        response = app.post("/telegram", json=request)
        self.assertEqual(response.status_code, 200)