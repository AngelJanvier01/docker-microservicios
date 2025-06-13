from faker import Faker
import requests, sys, json, random, uuid
from datetime import date

result = requests.get('http://tyk-gateway:8080/gestor-clientes/clients')
if result.status_code != 200:
    print("error while try to fetch clients information")
    sys.exit()
payments_records = {}

clients = json.loads(result.text)
for client in clients:
    payments_to_simulate = random.randint(0,10)
    payments = []
    for x in range(payments_to_simulate):
        payment = {}
        payment['amount'] = random.randint(2500,8000)
        payment['transaction_type'] = random.choice(['transferencia', 'aplicacion', 'pagina-web'])
        payment['status'] = random.choice(['PENDING', 'IN-PROGRESS', 'COMPLETED', 'DECLINED'])
        payment['creation_date'] = date.today().strftime("%d/%m/%Y %H:%M:%S") 
        payment['transaction_id'] = uuid.uuid4().hex
        payment['source'] = random.choice(['conekta', 'openpay', 'paypal', 'mercado-pago'])
        payments.append(payment)
    payments_records[client['ssn']] = payments
print(json.dumps(payments_records, indent=4))
