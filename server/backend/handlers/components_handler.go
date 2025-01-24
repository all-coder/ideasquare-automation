package handlers

import (
	"backend/models"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

// use capital func names, otherwise they wouldn't be exported
func GetComponents(items *[]models.Component) gin.HandlerFunc {
	return func(c *gin.Context) {
		num := 10
		if numStr := c.Query("num"); numStr != "" {
			n, err := strconv.Atoi(numStr)
			if err != nil || n < -2 {
				c.JSON(http.StatusBadRequest, gin.H{"error": "num cannot be negative or invalid"})
				return
			}
			num = n
		}
		if num == -1 {
			c.IndentedJSON(http.StatusOK, *items)
			return
		}
		if len(*items) < num {
			c.IndentedJSON(http.StatusOK, *items)
			return
		}
		c.IndentedJSON(http.StatusOK, (*items)[:num])
	}
}

func AddNewComponent(items *[]models.Component) gin.HandlerFunc {
	return func(c *gin.Context) {
		var newComponent models.Component
		err := c.ShouldBindJSON(&newComponent)
		if err != nil {
			c.JSON(http.StatusBadRequest, "Failed to Add Component!")
			return
		}
		*items = append(*items, newComponent)
		c.IndentedJSON(http.StatusOK, newComponent)
	}
}
