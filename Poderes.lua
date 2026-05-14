local Poderes = {


----------------------- Tiers + players Configurados


	[3733387773] = { ---- Id do player (Script modificavel de player para player) (drccastr57)
	---	Titulo = 'O escolhido', (Temporariamente indisponivel)

		Status = {
			Vida = 10000,
			Velocidade = 16, --- Padão 16
			Pulo = 50, --- Padrão 50
		},
		
		Itens = { --- 0 não ganha item, 1 ganha o item
		['Ex1'] = 0;
		['Ex2'] = 0;
		['Ex3'] = 0;
		['Ex4'] = 0;
		['Ex5'] = 0;
		['Ex6'] = 0	;
		},

		PermissoesCustomizadas = {
			Chute = true, --- false or true
			Soco = true, --- false or true
			Dash = true, --- false or true
			PoderdaFala = true, --- false or true (Conciste em quando mandar "PF, user death" o player morre)
--- poder da fala vai ter (kick,ban,kill,explode,freeze,jail,bring,to)
		},


	},

	----------------------------------- Players ---------------------------------------------
}

return Poderes