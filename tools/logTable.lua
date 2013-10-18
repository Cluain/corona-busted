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

logTable = function(tab)
    local t = debug.getinfo(2)
    local f = string.gsub(string.gsub(t.source, "/.*/", ""), ".lua", "")
    print("--------------")
    print(string.format("PRINTING TABLE %s [%s:%s]", tostring(tab), f, t.currentline))
    local function logTableLocal(o, level)
        local tabs = ""

        for i = 1, level do
            tabs = tabs .. "\t"
        end
        for k, v in pairs(o) do
            if type(v) == "table" then
                print(string.format(tabs .. "%s \t {", tostring(k)))
                logTableLocal(v, level + 1)
                print(string.format(tabs .. "}"))
            else
                print(string.format(tabs .. "%s \t : %s", tostring(k), tostring(v)))
            end
        end
    end

    logTableLocal(tab, 1)
    print("FINISHED PRINTING TABLE")
    print("--------------")
end

shallowLogTable = function(tab, maxDepth)
    local t = debug.getinfo(2)
    local f = string.gsub(string.gsub(t.source, "/.*/", ""), ".lua", "")
    print("--------------")
    print(string.format("SHALLOW PRINTING TABLE %s [%s:%s]", tostring(tab), f, t.currentline))
    local function logTableLocal(o, level, depth)
        local tabs = ""

        for i = 1, level do
            tabs = tabs .. "\t"
        end
        for k, v in pairs(o) do
            if type(v) == "table" then
                print(string.format(tabs .. "%s \t {", tostring(k)))
                if depth > 0 then logTableLocal(v, level + 1, depth - 1) end
                print(string.format(tabs .. "}"))
            else
                print(string.format(tabs .. "%s \t : %s", tostring(k), tostring(v)))
            end
        end
    end

    logTableLocal(tab, 1, maxDepth)
    print("SHALLOW FINISHED PRINTING TABLE")
    print("--------------")
end