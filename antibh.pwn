/*

		Kazuji - 18:37:30 PM
				 25/12/2023
*/

#define FILTERSCRIPT

#include <a_samp>

#define COLOR_LIGHTBLUE 0x33CCFFAA
new AntiBH[MAX_PLAYERS];

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Anti-BH Laik Jegeerpe Proyek Nyata");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	AntiBH[playerid] = 0;
	return 1;
}
forward PressJump(playerid);
public PressJump(playerid)
{
    AntiBH[playerid] = 0;
    ClearAnimations(playerid);
    return 1;
}
forward PressJumpReset(playerid);
public PressJumpReset(playerid)
{
    AntiBH[playerid] = 0;
    return 1;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if((newkeys & KEY_JUMP) && !IsPlayerInAnyVehicle(playerid))
	{
        AntiBH[playerid]++;
        SetTimerEx("PressJumpReset", 3000, false, "i", playerid);
        if(AntiBH[playerid] == 3)
		{
            ApplyAnimation(playerid, "PED", "KO_skid_back", 4.1, 0, 1, 1, 1, 0, 1);
            SetTimerEx("PressJump", 8500, false, "i", playerid);
        }
    }
    return 1;
}