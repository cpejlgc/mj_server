local db = require "db"

local M = {}

M.__index = M

function M.create(...)
    local o = {}
    setmetatable(o, M)

    M.init(o, ...)
    return o
end

function M:init(fd, account)
    self.fd = fd
    self.account = account
    self.status = "load from db"
end

function M:load_from_db()
    local obj = db:load_player(self.account)
    self._db = obj
end

function M:pack()
    return {
        account = self.account,
        nick_name = self._db.nick_name,
        socre = self._db.score
    }
end

return M
