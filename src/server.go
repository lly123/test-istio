package main

import (
	"github.com/labstack/echo/v4"
	"github.com/segmentio/ksuid"
	"os"
)

func main() {
	server := echo.New()
	server.HideBanner = true
	uuid := ksuid.New().String()
	version := os.Getenv("VERSION")

	server.GET("/hello", func(ctx echo.Context) error {
		if version == "" {
			return ctx.JSON(200, struct {
				ID string `json:"id" xml:"id"`
			}{
				ID: uuid,
			})
		} else {
			return ctx.JSON(200, struct {
				ID      string `json:"id" xml:"id"`
				Version string `json:"version" xml:"version"`
			}{
				ID:      uuid,
				Version: version,
			})
		}
	})

	server.Logger.Fatal(server.Start(":8080"))
}
