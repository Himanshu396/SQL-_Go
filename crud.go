package main

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	fmt.Println("go mysql driver select query resuts")
	db, err := sql.Open("mysql", "root:root12345@tcp(localhost:3306)/himanshu")

	if err != nil {
		panic(err.Error())
	}
	rows, err := db.Query("SELECT * FROM student")

	checkErr(err)

	for rows.Next() {

		var student_id int
		var name string
		var major string
		var gpa float64

		err = rows.Scan(&student_id, &name, &major, &gpa)
		checkErr(err)
		fmt.Println(student_id)
		fmt.Println(name)
		fmt.Println(major)
		fmt.Println(gpa)

	}

	defer db.Close()

}

func checkErr(err error) {
	if err != nil {
		panic(err)
	}
}
