package models

type Component struct {
	Id          int    `json:"id"`
	Name        string `json:"name"`
	Available   uint   `json:"available"`
	Description string `json:"description"`
	Datasheet   string `json:"datasheet"`
	Position    []uint `json:"position"`
	Image       string `json:"image"`
}
