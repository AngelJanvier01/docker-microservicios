package main

import (
	"encoding/json"
	"fmt"
	"html"
	"io/ioutil"
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
)

type PaymentRecord struct {
	Amount          int    `json:"amount"`
	TransactionType string `json:"transaction_type"`
	Status          string `json:"status"`
	CreationDate    string `json:"creation_date"`
	TransactionID   string `json:"transaction_id"`
	Source          string `json:"source"`
}

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/", Index)
	router.HandleFunc("/records", GetPayments)
	
	log.Println("Servidor de pagos iniciado en puerto 8003")
	log.Fatal(http.ListenAndServe(":8003", router))
}

func Index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
}

func GetPayments(w http.ResponseWriter, r *http.Request) {
	filePath := "/data/payment_records.json"
	
	// Verificar si el archivo existe
	if _, err := os.Stat(filePath); os.IsNotExist(err) {
		log.Printf("Archivo no encontrado: %s", filePath)
		http.Error(w, "Payment records file not found", http.StatusNotFound)
		return
	}
	
	data, err := ioutil.ReadFile(filePath)
	if err != nil {
		log.Printf("Error leyendo archivo: %v", err)
		http.Error(w, "Error reading file: "+err.Error(), http.StatusInternalServerError)
		return
	}

	var payments map[string][]PaymentRecord

	err = json.Unmarshal(data, &payments)
	if err != nil {
		log.Printf("Error parseando JSON: %v", err)
		http.Error(w, "Error unmarshaling JSON: "+err.Error(), http.StatusInternalServerError)
		return
	}

	log.Printf("Enviando %d grupos de pagos", len(payments))
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(payments)
}