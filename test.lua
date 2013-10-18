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

-- load custom asserts
require("similarList")

-- set global Corona variables
display = require('mockDisplay')
Runtime = require("mockRuntime")
system = require("mockSystem")
native = require("mockNative")
graphics = require("mockGraphics")
timer = require("mockTimer")
transition = require("mockTransition")
math = require("mockMath")

-- custom modules from code exchange
log = require("mockLog")
ice = require("mockIce")
package.loaded["ice"] = package.loaded["mockIce"]


-- some helper functions
require("logTable")



-- require your test suites here
require("exampleSuite")
