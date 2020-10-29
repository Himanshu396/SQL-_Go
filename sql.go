package main

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	fmt.Println("go connect to mysql - himanshu")
	db, err := sql.Open("mysql", "root:root12345@tcp(127:0:0:1:3307)/himanshu")

	if err != nil {
		panic(err.Error())
	}

	fmt.Println("Connected")

	defer db.Close()

}
