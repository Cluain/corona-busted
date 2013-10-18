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
-- Date: 10/18/13
-- Time: 8:30 PM
--
--

describe("Just a sample", function()

    local ev = require'ev'
    setloop('ev')

    local asynchronous_call = function(functionToCall, delay)
        ev.Timer.new(function()
            functionToCall()
        end, delay / 1000):start(ev.Loop.default)
    end

    it("test something out", function(done)

        local listener = {
            transitionComplete = function() end
        }

        local transitionSpy = spy.on(listener, "transitionComplete")

        local rect = display.newRect(100, 100, 200, 200)

        transition.to(rect, {time = 500, x = 200, y = 230, onComplete = listener.transitionComplete})

        asynchronous_call(async(function()
            assert.equals(rect.x, 200)
            assert.equals(rect.y, 230)
            assert.spy(transitionSpy).was.called(1)
            done()
        end), 600)

    end)

end)
