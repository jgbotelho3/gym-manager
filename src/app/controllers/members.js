const { age, date } = require('../../Utils/utils')
const Member = require('../models/Member')

module.exports = {
  index (req, res) {
    let { filter, page } = req.query

    page = page || 1
    const limit = 3
    let offset = limit * (page - 1)

    const params = {
      filter,
      page,
      limit,
      offset,
      callback (members) {
        const pagination = {
          total: Math.ceil(members[0].total / limit),
          page
        }

        return res.render('members/index', {
          members,
          pagination,
          filter
        })
      }
    }

    Member.paginate(params)
  },

  create (req, res) {
    Member.instructorsSelectOptions(options => {
      return res.render('members/create', { instructorOptions: options })
    })
  },

  post (req, res) {
    const keys = Object.keys(req.body)
    let error = ''
    for (key of keys) {
      if (req.body[key] == '') {
        return res.send('Preencha todos os campos')
      }
    }

    Member.create(req.body, member => {
      if (!member) return res.send('Error!!!')

      return res.redirect('/members')
    })
  },

  show (req, res) {
    Member.find(req.params.id, member => {
      if (!member) return res.send('Member not found')

      member.birth = date(member.birth).birthDay

      Member.instructorsSelectOptions(options => {
        return res.render('members/show', {
          member,
          instructorOptions: options
        })
      })
    })
  },

  edit (req, res) {
    Member.find(req.params.id, member => {
      if (!member) return res.send('Member not found')

      member.birth = date(member.birth).iso

      Member.instructorsSelectOptions(options => {
        return res.render('members/edit', {
          member,
          instructorOptions: options
        })
      })
    })
  },

  put (req, res) {
    const keys = Object.keys(req.body)
    let error = ''
    for (key of keys) {
      if (req.body[key] == '') {
        return res.send('Preencha todos os campos')
      }
    }

    Member.update(req.body, () => {
      return res.redirect(`members/${req.body.id}`)
    })
  },
  delete (req, res) {
    Member.delete(req.body.id, () => {
      return res.redirect('members')
    })
  }
}
