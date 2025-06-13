package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"

	"./telegram"
)

type PaymentRecord struct {
	PolicyID   string  `json:"policy_id"`
	ClientName string  `json:"client_name"`
	Amount     float64 `json:"amount"`
	Status     string  `json:"status"`
	TelegramID int64   `json:"telegram_id"`
}

func main() {
	data, err := ioutil.ReadFile("payment_records.json")
	if err != nil {
		log.Fatalf("Error al leer archivo JSON: %v", err)
	}

	var records []PaymentRecord
	if err := json.Unmarshal(data, &records); err != nil {
		log.Fatalf("Error al parsear JSON: %v", err)
	}

	for _, record := range records {
		if record.Status == "PAID" {
			msg := fmt.Sprintf("Hola %s, tu pago ha sido validado. Tu póliza (ID: %s) ha sido renovada.", record.ClientName, record.PolicyID)
			telegram.SendMessage(record.TelegramID, msg)

			policyMsg := fmt.Sprintf("Aquí está tu póliza. Gracias por confiar en GlobalSurance. Monto pagado: $%.2f", record.Amount)
			telegram.SendMessage(record.TelegramID, policyMsg)
		}
	}
}
