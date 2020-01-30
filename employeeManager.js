let mysql = require('mysql');
let inquirer = require('inquirer');
let cTable = require('console.table');

var connection = mysql.createConnection({
    host: "localhost",
  
    // Your port; if not 3306
    port: 3306,
  
    // Your username
    user: "root",
  
    // Your password
    password: "ArchAngelPassword1",
    database: "company_db"
  });

  connection.connect(function(err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    start();
  });

function start(){
  inquirer
    .prompt([
        {
            type: "list",
            message: "What would you like to do?",
            choices: ["View all Employees","View all Employees by Department","Add Employee","Update Employee Role", "Update Employee Manager",
                        "View all Roles", "Add Role", "View All Departments","Add Department","Exit"],
            name: "role"
        }
    ])
    .then(response =>{
        switch(response.role){
            case "View all Employees":
                view("employees");
                break;
            case "View all Employees by Department":
                viewBy("employees","department");
                break;
            case "Add Employee":
                add("employee");
                break;
            case "Update Employee Role":
                updateRole()
                break;
            case "Update Employee Manager":
                updateManager()
                break;
            case "View all Roles":
                view("role");
                break;
            case "Add Role":
                add("role");
                break;
            case "View All Departments":
                view("department");
                break;
            case "Add Department":
                add("department");
                break;
            case "Exit":
                connection.end();
                process.exit(-1);
                 break;
        }
    });
;
}

function view(item){

    connection.query(`SELECT * FROM ${item}`, function(err, res) {
        if (err) throw err;
        console.table(res);
        start();
      });
    
}

function viewBy(viewItem,byItem){
    connection.query(`SELECT * FROM department`, function(err, res) {
        if (err) throw err;
        viewByDepartment(res);
      });
}

function updateRole(){
    connection.query(
        `SELECT first_name,last_name,id
        FROM employees`,
         function(err, res) {
        if (err) throw err;
        employees = res;
        updateRole2(res);
      });
}

function updateRole2(empItem){
    let employeeVar = [];
    empItem.forEach(element => {
        let nameVar = element.first_name +" "+element.last_name;
        employeeVar.push(nameVar);
    });

    connection.query(`SELECT title,id FROM role`, function(err, res) {
        if (err) throw err;
        updateRoleFinal(empItem,employeeVar,res);
      });
}

function updateRoleFinal(empItem,empVar,roleVar){
    let roles = [];
    roleVar.forEach(element => {
         roles.push(element.title);
    }); 
    inquirer
          .prompt([
              {
                  name: "empChoice",
                  type: "list",
                  choices:empVar,
                  filter: function(val){
                      let n = val.search(" ");
                      let name = val.slice(0,n);
                      let realValue = 0;
                      empItem.forEach(element => {
                          if(name === element.first_name){
                              realValue = element.id;
                              return realValue;
                          }
                      });
                      return realValue;
                  },
                  message: "Choose Employee to Update:"
              },
              {
                name: "roleChoice",
                type: "list",
                choices:roles,
                filter: function(val){
                    let realValue = 0;
                    roleVar.forEach(element => {
                        if(val === element.title){
                            realValue = element.id;
                            return realValue;
                        }
                    });
                    return realValue;
                },
                message: "Choose new Role:"
            },
          ])
          .then(response =>{
            connection.query(
                "UPDATE employees SET ? WHERE ?",
                [
                {
                    role_id: response.roleChoice
                },
                {
                    id: response.empChoice
                }
                ],
                function(error) {
                if (error) throw err;
                console.log("Employee updated successfully!");
                start();
                }
            );
          });
}

function add(querySelector){
    switch(querySelector){
        case "employee":
            connection.query(`SELECT * FROM role`, function(err, res) {
                if (err) throw err;
                addEmployee(res);
              });
            break;
        case "role":
            connection.query(`SELECT * FROM department`, function(err, res) {
                if (err) throw err;
                addRole(res);
              });
            break;
        case "department":
            inquirer
                .prompt([
                    {
                        name: "name",
                        type: "input",
                        message: "Please enter the new Department's name:"
                    }
                ])
                .then(response =>{
                    connection.query(
                        "INSERT INTO department SET ?",
                        {
                        name: response.name
                        },
                        function(err) {
                        if (err) throw err;
                        console.log("Department added successfully");
                        // re-prompt the user for if they want to bid or post
                        start();
                        }
                    );
                });
            break;
    }
}

function addEmployee(roleRes){
    let roles = [];
    roleRes.forEach(element => {
         roles.push(element.title);
    });
    inquirer
        .prompt([
            {
            name: "firstName",
            type: "input",
            message: "Please enter the employee's first name:"
            },
            {
            name: "lastName",
            type: "input",
            message: "Please enter the employee's last name:"
            },
            {
            name: "role",
            type: "list",
            choices: roles,
            filter: function(val){
                let realValue = 0;
                roleRes.forEach(element => {
                    if(val === element.title){
                        realValue = element.id;
                        return realValue;
                    }
                });
                return realValue;
            },
            message: "Please choose the employee's title:"
            },
            {
            name: "manager",
            type: "input",
            message: "Please enter the employee's manager:"
            }
        ])
        .then(response =>{
            console.log(response);
            connection.query(
                "INSERT INTO employees SET ?",
                {
                first_name: response.firstName,
                last_name: response.lastName,
                role_id: response.role,
                manager_id: response.manager || null
                },
                function(err) {
                if (err) throw err;
                console.log("Employee added successfully");
                start();
                }
            );
        });
}

function addRole(deptRes){
    let depts = [];
    deptRes.forEach(element => {
         depts.push(element.name);
    });
    inquirer
        .prompt([
            {
            name: "title",
            type: "input",
            message: "Please enter this positions's Title:"
            },
            {
            name: "salary",
            type: "input",
            message: "Please enter this position's annual Salary:"
            },
            {
            name: "department",
            type: "list",
            choices: depts,
            filter: function(val){
                let realValue = 0;
                deptRes.forEach(element => {
                    if(val === element.name){
                        realValue = element.id;
                        return realValue;
                    }
                });
                return realValue;
            },
            message: "Please choose this position's Department:"
            }
        ])
        .then(response =>{
            console.log(response);
            connection.query(
                "INSERT INTO role SET ?",
                {
                title: response.title,
                salary: response.salary,
                department_id: response.department
                },
                function(err) {
                if (err) throw err;
                console.log("Role added successfully");
                start();
                }
            );
        });
}

function viewByDepartment(deptVar){
    let depts = [];
    deptVar.forEach(element=>{
        depts.push(element.name);
    })
    inquirer
        .prompt([
            {
                name: "deptChoice",
                type: "list",
                choices:depts,
                filter: function(val){
                    let realValue = 0;
                    deptVar.forEach(element => {
                        if(val === element.name){
                            realValue = element.id;
                            return realValue;
                        }
                    });
                    return realValue;
                },
                message: "Choose Department to view by:"
            }
        ])
        .then(response =>{
            connection.query(
                `SELECT id,title 
                FROM role
                WHERE department_id=${response.deptChoice}`,
                function(err, res) {
                    if (err) throw err;
                    console.log(res);
                    selectEmployees(res);
                }
            )
        })
}

function selectEmployees(roleVar){
    let selector = "";
    for (var i=0, len=roleVar.length; i<len; i++){
        selector += roleVar[i].id
        if (roleVar[i+1] !== undefined){
            selector += ","
        }
    }
    connection.query(
                `SELECT * 
                FROM employees 
                WHERE role_id IN (${selector})`,
                function(err, res) {
                    if (err) throw err;
                    console.table(res);
                    start();
                }
            )
    
}

