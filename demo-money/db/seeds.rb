# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
    {email:'myselt@gmail.com', fullname:'lam minh nhat', password:'12345', permission:1,del:0},
    {email:'atin@gmail.com', fullname:'anh Tin', password:'12345', permission:1,del:0},
    {email:'aphong@gmail.com', fullname:'anh Phong', password:'12345', permission:1,del:0},
    {email:'atung@gmail.com', fullname:'anh Tung', password:'12345', permission:1,del:0},
    {email:'kthanh@gmail.com', fullname:'ku Thanh', password:'12345', permission:1,del:0},
    {email:'odang@gmail.com', fullname:'ong Dang', password:'12345', permission:1,del:0},
    {email:'aduy@gmail.com', fullname:'anh Duy', password:'12345', permission:1,del:0},
])

Transaction.create([
    {debtorid: 2, creditorid: 1, amount: 12000,datedebt: '2019/10/12',status: 1, note: '1 ly cf guta'},
    {debtorid: 2, creditorid: 1, amount: 11000,datedebt: '2019/10/12',status: 2, note: '2 ly cf guta'},
    {debtorid: 2, creditorid: 1, amount: 3000,datedebt: '2019/10/12',status: 3, note: '3 ly cf guta'},
    {debtorid: 2, creditorid: 1, amount: 3000,datedebt: '2019/10/12',status: 4, note: '4 ly cf guta'},
    {debtorid: 2, creditorid: 1, amount: 3000,datedebt: '2019/10/12',status: 5, note: '5 ly cf guta'},
    {debtorid: 3, creditorid: 1, amount: 5000,datedebt: '2019/10/12',status: 1, note: '2 dia com suon'},
    {debtorid: 3, creditorid: 1, amount: 2000,datedebt: '2019/10/12',status: 1, note: 'thanh toan apple'},
    {debtorid: 3, creditorid: 1, amount: 112000,datedebt: '2019/12/12',status: 2, note: 'dk sakura'},
    {debtorid: 4, creditorid: 1, amount: 10000,datedebt: '2019/12/12',status: 3, note: 'mc donal buger'},
    {debtorid: 4, creditorid: 1, amount: 75000,datedebt: '2019/12/12',status: 1, note: 'chua rut tien'},
    {debtorid: 5, creditorid: 1, amount: 21000,datedebt: '2019/12/12',status: 1, note: 'thanh toan tiki'},
    {debtorid: 5, creditorid: 1, amount: 43000,datedebt: '2019/12/12',status: 4, note: '2 ly cf guta'},
    {debtorid: 5, creditorid: 1, amount: 11000,datedebt: '2019/12/12',status: 1, note: '2 ly cf guta'},
    {debtorid: 6, creditorid: 1, amount: 19000,datedebt: '2019/12/12',status: 5, note: '2 ly cf guta'},
    {debtorid: 7, creditorid: 1, amount: 32000,datedebt: '2019/12/12',status: 1, note: '2 ly cf guta'},
    {debtorid: 7, creditorid: 1, amount: 19000,datedebt: '2019/12/12',status: 2, note: '2 ly cf guta'},
    {debtorid: 7, creditorid: 1, amount: 129000,datedebt: '2019/12/12',status: 1, note: '2 ly cf guta'},
    {debtorid: 7, creditorid: 1, amount: 49000,datedebt: '2019/12/12',status: 4, note: '2 ly cf guta'},
    {debtorid: 7, creditorid: 1, amount: 65000,datedebt: '2019/12/12',status: 1, note: '2 ly cf guta'}
])