import json, os
import unittest
from src.application import create_app
from src.helpers.processor import create_policy
import urllib.parse

class TestReport(unittest.TestCase):

    def test_create_policy(self):
        policy_data = {
            "address": "05452 Bass Path\nSanchezport, MI 26978",
            "birthdate": "24-01-1954",
            "blood_group": "AB-",
            "company": "Watkins, Evans and Meyer",
            "job_title": "Professor Emeritus",
            "last_name": "Lambert",
            "name": "Michael",
            "policy": "V57166",
            "sex": "M",
            "ssn": "409-45-2021"
        }
        create_policy(policy_data)
        assert os.path.exists("policy.html")
        assert os.path.exists("policy.pdf")


    def test_create_report(self):
        app = create_app().test_client()
        data = {
            "address": "05452 Bass Path\nSanchezport, MI 26978",
            "birthdate": "24-01-1954",
            "blood_group": "AB-",
            "company": "Watkins, Evans and Meyer",
            "job_title": "Professor Emeritus",
            "last_name": "Lambert",
            "name": "Michael",
            "policy": "V57166",
            "sex": "M",
            "ssn": "409-45-2021"
        }
        encoded_data = urllib.parse.quote(json.dumps(data))
        response = app.get(f"/policy.pdf?data={encoded_data}")
        self.assertEqual(response.status_code, 200, "Failed to generate policy PDF")
        self.assertEqual(response.content_type, "application/pdf", "Response is not a PDF")
        self.assertTrue(response.data.startswith(b"%PDF"), "Response is not a valid PDF")

    def test_health_check(self):
        app = create_app().test_client()
        response = app.get("/health")
        self.assertEqual(response.status_code, 200, "Failed to generate policy PDF")
        self.assertEqual(response.content_type, "application/json", "Response is not a valid JSON")
    
    def test_swagger(self):
        app = create_app().test_client()
        response = app.get("/")
        self.assertEqual(response.status_code, 200, "Swagger is not loaded")