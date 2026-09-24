local TableFunctions = {}

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
