const addBtn = document.querySelector('#add-btn');
const resetBtn = document.querySelector('#reset-btn');
const backBtn = document.querySelector('#back-btn');
const updateBtn = document.querySelector('#update-btn');

const firstName = document.querySelector('#firstName');
const lastName = document.querySelector('#lastName');
const phoneNumber = document.querySelector('#phoneNumber');
const dateOfBirth = document.querySelector('#dateOfBirth');
const gender = document.querySelector('input[name="flexRadioDefault"]:checked');
const account = document.querySelector('#account');
const email = document.querySelector('#email');
const password = document.querySelector('#password');
const address = document.querySelector('#address');
const active = document.querySelector('#active');
const department = document.querySelector('#department');
const remark = document.querySelector('#remark');
const status = document.querySelector('#status-add')
const employeeId = document.querySelector('#employeeId')
const accountId = document.querySelector("#accountId")

const formsInput = {
    firstName: document.querySelector('#firstName'),
    lastName: document.querySelector('#lastName'),
    phoneNumber: document.querySelector('#phoneNumber'),
    dateOfBirth: document.querySelector('#dateOfBirth'),
    account: document.querySelector('#account'),
    email: document.querySelector('#email'),
    password: document.querySelector('#password'),
    department: document.querySelector('#department'),
}

addBtn.onclick = (b) => {
    b.preventDefault();
    checkNull()
}

function checkNull() {
    let isNull = false
    Object.values(formsInput).forEach(e => {
        if (e.value.trim() === '') {
          isNull = true
          e.nextElementSibling.classList.remove('invalid-feedback')
        } else {
            e.nextElementSibling.classList.add('invalid-feedback')
        }
    })

    if (password.value.length < 8) {
        isNull = true
        password.nextElementSibling.classList.remove('invalid-feedback')
    } else {
        password.nextElementSibling.classList.add('invalid-feedback')
    }

    if (isNull) {
        console.log("Is invalid inputs")
        return
    }

    const data = {
        firstName: firstName.value,
        lastName: lastName.value,
        phone: phoneNumber.value,
        dob: dateOfBirth.value,
        gender: gender.checked ? 0 : 1,
        account: account.value,
        email: email.value,
        password: password.value,
        address: address.value,
        departmentName: department.value,
        remark: remark.value,
        status: active.checked ? 0 : 1,
    }

    fetch('/employee', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(data),
    })
    .then((res) => {
        if (res.ok) {
            status.innerText = 'Added Employee successful.'
            Object.values(formsInput).forEach(e => {
                e.value = ''
            })
            remark.value = ''
            address.value = ''
            active.checked = false
            document.documentElement.scrollTop = 0
        } else {
            console.error('Request failed with status:', res.status);
            status.innerText = 'Add Employee failed.'
            Object.values(formsInput).forEach(e => {
                e.value = ''
            })
            remark.value = ''
            address.value = ''
            active.checked = false
            document.documentElement.scrollTop = 0
        }
    }
    )
    .catch((e) => {
        status.innerText = 'Add Employee failed.'
        Object.values(formsInput).forEach(e => {
            e.value = ''
        })
        remark.value = ''
        address.value = ''
        active.checked = false
        document.documentElement.scrollTop = 0
        console.log(e)
    })
}

updateBtn.onclick = () => {
    let isNull = false
    Object.values(formsInput).forEach(e => {
        if (e.value.trim() === '') {
            isNull = true
            e.nextElementSibling.classList.remove('invalid-feedback')
        } else {
            e.nextElementSibling.classList.add('invalid-feedback')
        }
    })

    if (password.value.length < 8) {
        isNull = true
        password.nextElementSibling.classList.remove('invalid-feedback')
    } else {
        password.nextElementSibling.classList.add('invalid-feedback')
    }

    if (isNull) {
        console.log("Is invalid inputs")
        return
    }

    const data2 = {
        firstName: firstName.value,
        lastName: lastName.value,
        phone: phoneNumber.value,
        dob: dateOfBirth.value,
        gender: gender.checked ? 0 : 1,
        account: account.value,
        email: email.value,
        password: password.value,
        address: address.value,
        departmentName: department.value,
        remark: remark.value,
        status: active.checked ? 0 : 1,
        employeeId: parseInt(employeeId.value),
        accountId: parseInt(accountId.value),
    }

    fetch('/employee', {
        method: 'PUT',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(data2),
    })
        .then((res) => {
                if (res.ok) {
                    status.innerText = 'Update Employee successful.'
                    Object.values(formsInput).forEach(e => {
                        e.value = ''
                    })
                    remark.value = ''
                    address.value = ''
                    active.checked = false
                    document.documentElement.scrollTop = 0
                } else {
                    console.error('Request failed with status:', res.status);
                    status.innerText = 'Update Employee failed.'
                    Object.values(formsInput).forEach(e => {
                        e.value = ''
                    })
                    remark.value = ''
                    address.value = ''
                    active.checked = false
                    document.documentElement.scrollTop = 0
                }
            }
        )
        .catch((e) => {
            status.innerText = 'Add Employee failed.'
            Object.values(formsInput).forEach(e => {
                e.value = ''
            })
            remark.value = ''
            address.value = ''
            active.checked = false
            document.documentElement.scrollTop = 0
            console.log(e)
        })
}

resetBtn.onclick = (b) => {
    b.preventDefault()
    Object.values(formsInput).forEach(e => {
        e.value = ''
    })
    remark.value = ''
    address.value = ''
    active.checked = false
}

backBtn.onclick = (b) => {
    b.preventDefault()
    history.back()
}
