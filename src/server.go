package main

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
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

	server.GET("/db", func(ctx echo.Context) error {
		db, err := sql.Open("mysql", "root:pass@tcp(mysql.cn-mx.svc.cluster.local:3306)/apollo_config_db")
		if err != nil {
			panic(err)
		}
		defer db.Close()

		results, err := db.Query("SELECT name FROM apollo_config_db.`release` where id=1")
		if err != nil {
			panic(err)
		}

		var names []string
		for results.Next() {
			var name string
			err = results.Scan(&name)
			if err != nil {
				panic(err)
			}
			names = append(names, name)
		}

		return ctx.JSON(200, struct {
			ID    string   `json:"id" xml:"id"`
			Names []string `json:"names" xml:"names"`
		}{
			ID:    uuid,
			Names: names,
		})
	})

	server.Logger.Fatal(server.Start(":8080"))
}
