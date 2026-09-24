local TableFunctions = {}

function TableFunctions.concat(tableData, separator, start, stop)
    return table.concat(tableData, separator, start, stop)
end

function TableFunctions.insert(tableData, position, value)
	return table.insert(tableData, position, value)
end

function TableFunctions.move(source, sourcePos, targetEnd, targetPos, target)
    return table.move(source, sourcePos, targetEnd, targetPos, target)
end

function TableFunctions.pack(...)
    return table.pack(...)
end

function TableFunctions.remove(tableData, position)
    return table.remove(tableData, position)
end

function TableFunctions.sort(tableData, comp)
    return table.sort(tableData, comp)
end

function TableFunctions.unpack(tableData, start, stop)
    return table.unpack(tableData, start, stop)
end

function TableFunctions.find(SearchTable, Value) --Returns the index of a value within a table or false
    for i, iValue in ipairs(SearchTable) do
        if iValue == Value then
            return i
        end
    end
    return false
end

function TableFunctions.findFirstMatch(tablea, tableb) --Returns the index or key in table a of the first matching value found
    for kA, vA in pairs(tablea) do
        for kB, vB in pairs(tableb) do
            if vA == vB then
                return kA
            end
        end
    end
    return false
end

function TableFunctions.doContentsExistIn(tablea, tableb) --Returns true if all contents of table a are within table b
    for k, value in pairs(tablea) do
        if not TableFunctions.find(tableb, value) then
            return false
        end
    end
    return true
end

function TableFunctions.deepCopy(Table) --Clones ALL content of a table including nested tables
    local NewTable = {}
    for key, value in pairs(Table) do
        local ValueToAdd;
        if type(value) == "table" then
            ValueToAdd = TableFunctions.deepCopy(value)
        else
            ValueToAdd = value
        end
        NewTable[key] = ValueToAdd
    end
    return NewTable
end

return TableFunctions
