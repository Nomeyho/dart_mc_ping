import 'package:dart_mc_ping/dart_mc_ping.dart';
import 'package:dart_mc_ping/logger.dart';
import 'package:test/test.dart';

void main() {
  /// https://minecraftservers.org/index/1
  test('Test on real server list', () async {
    configureLogger();

    /// Page 1
    await ping('hub.mcs.gg');
    await ping('mc.mythcraft.gg');
    await ping('hub.bmc.gg');
    await ping('grmpixelmon.com');
    await ping('one.lemoncloud.net');
    await ping('play.extremecraft.net');
    // await ping('play.invadedlands.net');
    await ping('hub.mcs.gg');
    await ping('play.cubecraft.net');
    // await ping('minehut.com');
    // await ping('hub.mc-complex.com');
    await ping('pvpwars.net');
    await ping('Play.datblock.com');
    await ping('mccentral.org');
    await ping('org.archonhq.net');
    await ping('play.loverfella.com');
    await ping('play.mineheroes.org');
    await ping('play.mc-blaze.com');
    await ping('one.lemoncloud.net');
    await ping('mc-gtm.net');

    /// Page 2
    await ping('mc.gamster.org');
    await ping('join.manacube.net');
    await ping('EarthMC.net');
    // await ping('play.applecraft.org');
    await ping('us.mineplex.com');
    await ping('play.thedestinymc.com');
    await ping('play.vulengate.com');
    await ping('mc.snapcraft.net');
    // await ping('play.minewind.com');
    await ping('play.hoaxmc.com');
    await ping('mc.performium.net');
    await ping('mc.hypixel.net');
    // await ping('skykingdoms.net');
    await ping('play.skyblocknetwork.com');
    await ping('play.rinaorc.com');
    await ping('play.creativefun.net');
    // await ping('skyblock.net');
    await ping('mc.vanitymc.co');
    await ping('mc.minebox.es');
    // await ping('play.mcprison.com');

    /// Page 3
    await ping('org.AspiriaMc.com');
    // await ping('us.miningdead.com');
    // await ping('play.primemc.org');
    await ping('play.vipermc.net');
    await ping('org.desteria.net');
    // await ping('play.skycade.net');
    await ping('arefy.net');
    await ping('play.opblocks.com');
    await ping('omegacraft.cl');
    await ping('mc.vortexpvp.gg');
    await ping('mso.theseedmc.com');
    await ping('mc.jailbreakmc.com');
    await ping('faithfulmc.com');
    // await ping('mortalmines.com');
    await ping('play.pixelmonrealms.com');
    await ping('Play.pokegalaxia.com');
    await ping('mc.gamesmadeinpola.com');
    await ping('FadeCloud.com');
    await ping('join.mineville.org');
    await ping('play.simplesurvival.gg');

    /// Page 4
    await ping('mc.ventureland.net');
    // await ping('mineverse.com');
    await ping('join.insanitycraft.net');
    await ping('play.becto.net');
    await ping('mc.pvplab.net');
    await ping('play.alttd.com');
    await ping('pokecentral.org');
    await ping('play.pokeverse.org');
    await ping('play.craftadia.com');
    await ping('mc.detox.gg');
    await ping('hub.treemc.net');
    await ping('mc.lotc.co');
    await ping('play.mineraze.net');
    // await ping('mc.arkhamnetwork.org');
    await ping('play.fluxpvp.net');
    await ping('fun.multyplay.ro');
    await ping('mc.beanblockz.com');
    await ping('munchymc.com');
    await ping('play.ham5teak.xyz');
    await ping('play.potterworldmc.com');

    /// Page 5
    await ping('pixel.rc-gamers.com');
    await ping('play.breakdowncraft.com');
    await ping('play.poke-brawl.com');
    await ping('bulk.play-ml.ru');
    await ping('play.pokedash.org');
    await ping('minesaga.org');
    await ping('play.ggmc.me');
    await ping('play.cultivatemc.com');
    await ping('play.mcatlas.net');
    await ping('mc.pvpbulgaria.eu');
    await ping('play.koronakraft.com');
    // await ping('play.MuxMC.net');
    await ping('play.pokerivals.com');
    // await ping('veltpvp.com');
    await ping('play.mc-pgst.tw');
    await ping('Play.RoyalLegacy.Net');
    await ping('bartyrealms.com');
    await ping('play.skyrealms.games');
    await ping('grmpixelmon.com');
    await ping('play.mc-drugs.com');
  }, timeout: Timeout(Duration(minutes: 2)));
}
