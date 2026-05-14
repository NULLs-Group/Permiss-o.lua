local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

local Poderes = require(
	ReplicatedStorage
	:WaitForChild("Config")
	:WaitForChild("Poderes")
)

local Dados = Poderes[player.UserId]

-- Jogador sem configuração
if not Dados then
	warn("Jogador sem poderes configurados")
	return
end

print("Poderes carregados")

-- Aguarda personagem
local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")

-- Status
if Dados.Status then

	-- Vida
	if Dados.Status.Vida then
		humanoid.MaxHealth = Dados.Status.Vida
		humanoid.Health = Dados.Status.Vida

		print("Vida aplicada:", Dados.Status.Vida)
	end

	-- Velocidade
	if Dados.Status.Velocidade then
		humanoid.WalkSpeed = Dados.Status.Velocidade

		print("Velocidade aplicada:", Dados.Status.Velocidade)
	end

	-- Pulo
	if Dados.Status.Pulo then
		humanoid.JumpPower = Dados.Status.Pulo

		print("Pulo aplicado:", Dados.Status.Pulo)
	end
end

-- Itens
if Dados.Itens then

	local Backpack = player:WaitForChild("Backpack")
	local ServerStorage = game:GetService("ServerStorage")

	for nomeItem, valor in pairs(Dados.Itens) do

		if valor == 1 then

			local item = ServerStorage:FindFirstChild(nomeItem)

			if item then
				local clone = item:Clone()
				clone.Parent = Backpack

				print(nomeItem .. " entregue")
			else
				warn(nomeItem .. " nao encontrado no ServerStorage")
			end
		end
	end
end

-- Permissões customizadas
if Dados.PermissoesCustomizadas then

	for permissao, valor in pairs(Dados.PermissoesCustomizadas) do

		if valor == true then
			print(permissao .. " ativado")
		else
			print(permissao .. " desativado")
		end
	end
end