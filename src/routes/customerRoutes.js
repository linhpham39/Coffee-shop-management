const {Router} = require('express');
const customers = require('../controllers/customerController');
var router = Router();

router.get('/', customers.getCusomter);
router.post('/signup', customers.signUp);
router.post('/login', customers.login);
module.exports = router;