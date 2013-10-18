-- (C) Copyright 2013 Cluain Krystian Szczęsny (http://it.cluain.pl) and others.
--
-- All rights reserved. This program and the accompanying materials
-- are made available under the terms of the GNU Lesser General Public License
-- (LGPL) version 2.1 which accompanies this distribution, and is available at
-- http://www.gnu.org/licenses/lgpl-2.1.html
--
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- Lesser General Public License for more details.
--
-- User: Krystian Szczęsny
-- Date: 10/15/13
-- Time: 9:02 AM
--

local s = require("say")

local function similarList(state, arguments)

    if #arguments ~= 2 then return false end

    local table1, table2 = arguments[1], arguments[2]
    if not type(table1) == "table" or not type(table2) == "table" then
        return false
    end
    if #table1 ~= #table2 then return state.mod == false end

    local sameContent = false

    for i, value1 in ipairs(table1) do
        for j, value2 in ipairs(table2) do
            if value1 == value2 then
                sameContent = true
                break
            end
        end
        if not sameContent then break end
    end

    --in case of duplicates (example: [1,1,2] & [1,2,3])
    if sameContent then
        sameContent = false
        for i, value1 in ipairs(table2) do
            for j, value2 in ipairs(table1) do
                if value1 == value2 then
                    sameContent = true
                    break
                end
            end
            if not sameContent then break end
        end
    end

    return state.mod == sameContent
end

s:set("assertion.similar_list.positive", "Table %s has same content as \n%s")
s:set("assertion.similar_list.negative", "Table %s has different content than \n%s")
assert:register("assertion", "similar_list", similarList, "assertion.similar_list.positive", "assertion.similar_list.negative")