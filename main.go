package main

import (
	"errors"
	"log"

	"github.com/fatih/color"
)

func main() {
	var cesco string
	color.Cyan("Prints text in cyan.")
	log.Println("dsfmsldkf")
}

// MaxAge is a superfulous exported variable.
const MaxAge int = 70

// Person isas
type Person struct {
	Name string
	Age  int
}

// NewPerson is a super nice function
func NewPerson(name string) (*Person, error) {
	if name == "" {
		return nil, errors.New("Name is required")
	}

	return &Person{Name: name}, nil
}
