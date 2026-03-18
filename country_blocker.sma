#include <amxmodx>
#include <amxmisc>
#include <geoip>

#define PLUGIN_NAME     "Country Blocker"
#define PLUGIN_VERSION  "1.0"
#define PLUGIN_AUTHOR   "sakulmore"

new g_pCvarCountry
new g_pCvarEnabled
new g_pCvarViceVersa

public plugin_init() {
    register_plugin(PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_AUTHOR)
    
    g_pCvarCountry = register_cvar("cb_country", "")
    g_pCvarEnabled = register_cvar("cb_enabled", "0")
    g_pCvarViceVersa = register_cvar("cb_viceversa", "0")
}

public client_putinserver(id) {
    if (is_user_bot(id) || is_user_hltv(id)) return PLUGIN_CONTINUE
    
    if (get_pcvar_num(g_pCvarEnabled) == 0) return PLUGIN_CONTINUE
    
    new szCountries[128]
    get_pcvar_string(g_pCvarCountry, szCountries, charsmax(szCountries))
    
    if (!szCountries[0]) return PLUGIN_CONTINUE
    
    new szIP[32]
    get_user_ip(id, szIP, charsmax(szIP), 1)
    
    if (equal(szIP, "127.0.0.1") || equal(szIP, "loopback")) return PLUGIN_CONTINUE
    
    new szCode[3]
    new bool:bFound = false
    
    if (geoip_code2_ex(szIP, szCode)) {
        if (containi(szCountries, szCode) != -1) {
            bFound = true
        }
    }
    
    new iViceVersa = get_pcvar_num(g_pCvarViceVersa)
    new bool:bBlock = false
    
    if (iViceVersa == 0 && !bFound) {
        bBlock = true
    }
    else if (iViceVersa == 1 && bFound) {
        bBlock = true
    }
    
    if (bBlock) {
        server_cmd("kick #%d %cCountry restriction: You are not allowed to play on this server.%c", get_user_userid(id), 34, 34)
    }
    
    return PLUGIN_CONTINUE
}