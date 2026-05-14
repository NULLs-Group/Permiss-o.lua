local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

local Painel = require(
	ReplicatedStorage
	:WaitForChild("Config")
	:WaitForChild("Painel")
)

local playerGui = player:WaitForChild("PlayerGui")
local gui = playerGui:WaitForChild("MainGui")

print("Sistema iniciado")

-- Oculta tudo primeiro
for _, nome in ipairs(Painel.PaineAdm) do
	local frame = gui:FindFirstChild(nome)

	if frame then
		frame.Visible = false
		print(nome .. " ocultado")
	else
		warn(nome .. " nao encontrado")
	end
end

local Dados = Painel[player.UserId]

-- Sem permissao
if not Dados then
	warn("Jogador sem permissao")
	return
end

print("Permissao encontrada")

-- Libera apenas os permitidos
for _, nome in ipairs(Dados.Liberados) do
	local frame = gui:FindFirstChild(nome)

	if frame then
		frame.Visible = true
		print(nome .. " liberado")
	else
		warn(nome .. " nao encontrado para liberar")
	end
end