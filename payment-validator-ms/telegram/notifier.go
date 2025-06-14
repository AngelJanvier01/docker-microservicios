package telegram

import (
	"fmt"
	"log"
	"net/http"
	"net/url"
)

const botToken = "YOUR_TELEGRAM_BOT_TOKEN"

func SendMessage(chatID int64, message string) {
	baseURL := fmt.Sprintf("https://api.telegram.org/bot%s/sendMessage", botToken)
	resp, err := http.PostForm(baseURL, url.Values{
		"chat_id": {fmt.Sprintf("%d", chatID)},
		"text":    {message},
	})

	if err != nil {
		log.Printf("Error al enviar mensaje a Telegram: %v", err)
		return
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		log.Printf("Respuesta inesperada de Telegram: %v", resp.Status)
	}
}
