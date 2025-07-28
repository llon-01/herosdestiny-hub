for _, child in ipairs(ReplicatedStorage:GetDescendants()) do
    if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
        -- Проверяем, есть ли у объекта метод FireServer
        if child.FireServer then
            local oldFireServer = child.FireServer
            child.FireServer = function(self, ...)
                print("RemoteEvent FireServer called:", child.Name, ...)
                return oldFireServer(self, ...)
            end
        end

        -- Проверяем, есть ли у объекта метод InvokeServer
        if child.InvokeServer then
            local oldInvokeServer = child.InvokeServer
            child.InvokeServer = function(self, ...)
                print("RemoteFunction InvokeServer called:", child.Name, ...)
                return oldInvokeServer(self, ...)
            end
        end
    end
end
