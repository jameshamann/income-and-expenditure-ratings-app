// app/javascript/controllers/statement_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["incomeFields", "expenditureFields"]

  addIncomeField(event) {
    event.preventDefault()
    const newField = document.createElement('div')
    newField.classList.add('incomeField', 'input-group', 'mb-3')
    newField.innerHTML = `
      <span class="input-group-text">Income Name</span>
      <input type="text" name="statement[income][new][name]" class="form-control">
      <span class="input-group-text">£</span>
      <input type="number" step="0.01" placeholder="0.00" name="statement[income][new][value]" class="form-control">
      <button type="button" data-action="statements#removeIncomeField" class="btn btn-danger">Remove</button>
    `
    this.incomeFieldsTarget.appendChild(newField)
    this.updateNames(this.incomeFieldsTarget, 'statement[income]')
  }

  removeIncomeField(event){
    event.preventDefault()
    const field = event.target.closest('.incomeField')
    field.remove()

  } 

  addExpenditureField(event) {
    event.preventDefault()

    const newField = document.createElement('div')
    newField.classList.add('expenditureField','input-group', 'mb-3')
    newField.innerHTML = `
       <span class="input-group-text">Expenditure Name</span>
        <input type="text" name="statement[expenditure][new][name]" class="form-control">
        <span class="input-group-text">£</span>
        <input type="number" step="0.01" placeholder="0.00" name="statement[expenditure][new][value]" class="form-control">
        <button type="button" data-action="statements#removeExpenditureField" class="btn btn-danger">Remove</button>
    `
    this.expenditureFieldsTarget.appendChild(newField)
    this.updateNames(this.expenditureFieldsTarget, 'statement[expenditure]')
  }

  removeExpenditureField(event){
    event.preventDefault()
    const field = event.target.closest('.expenditureField')
    field.remove()

  } 


  updateNames(container, baseName) {
    const fields = container.querySelectorAll('.incomeField, .expenditureField')
    fields.forEach((field, index) => {
      const inputs = field.querySelectorAll('input')
      inputs.forEach(input => {
        const name = input.getAttribute('name')
        input.setAttribute('name', name.replace('new', index))
      })
    })
  }
}
