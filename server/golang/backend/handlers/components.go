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
				c.JSON(http.StatusBadRequest, gin.H{"Error": "num cannot be negative or invalid"})
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

func SearchComponent(items *[]models.Component) gin.HandlerFunc {
	return func(c *gin.Context) {
		idStr := c.Query("id")
		if idStr == "" {
			c.JSON(http.StatusBadRequest, gin.H{"Error": "Enter Proper Component ID"})
			return
		}
		id, err := strconv.Atoi(idStr)
		if err != nil || id <= 0 {
			c.JSON(http.StatusBadRequest, gin.H{"Error": "Enter Proper Component ID"})
			return
		}

		for _, component := range *items {
			if component.Id == id {
				c.IndentedJSON(http.StatusOK, component)
				return
			}
		}
		c.JSON(http.StatusNotFound, gin.H{"Error": "No Component Found"})
	}
}
