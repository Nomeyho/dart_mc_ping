import 'package:dart_mc_ping/dart_mc_ping.dart';
import 'package:dart_mc_ping/logger.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

_pingAndPrint(String ip) async {
  final response = await ping(ip);
  print(response.description.toColoredString());
}

void main() {
  /// https://minecraftservers.org/index/1
  test('Test on real server list', () async {
    configureLogger(level: Level.INFO);

    /// Page 1
    await _pingAndPrint('hub.mcs.gg');
    await _pingAndPrint('mc.mythcraft.gg');
    await _pingAndPrint('hub.bmc.gg');
    await _pingAndPrint('grmpixelmon.com');
    await _pingAndPrint('one.lemoncloud.net');
    await _pingAndPrint('play.extremecraft.net');
    // await _pingAndPrint('play.invadedlands.net');
    await _pingAndPrint('hub.mcs.gg');
    await _pingAndPrint('play.cubecraft.net');
    // await _pingAndPrint('minehut.com');
    // await _pingAndPrint('hub.mc-complex.com');
    await _pingAndPrint('pvpwars.net');
    await _pingAndPrint('Play.datblock.com');
    await _pingAndPrint('mccentral.org');
    await _pingAndPrint('org.archonhq.net');
    await _pingAndPrint('play.loverfella.com');
    await _pingAndPrint('play.mineheroes.org');
    await _pingAndPrint('play.mc-blaze.com');
    await _pingAndPrint('one.lemoncloud.net');
    await _pingAndPrint('mc-gtm.net');

    /// Page 2
    await _pingAndPrint('mc.gamster.org');
    await _pingAndPrint('join.manacube.net');
    // await _pingAndPrint('EarthMC.net');
    // await _pingAndPrint('play.applecraft.org');
    await _pingAndPrint('us.mineplex.com');
    await _pingAndPrint('play.thedestinymc.com');
    await _pingAndPrint('play.vulengate.com');
    await _pingAndPrint('mc.snapcraft.net');
    // await _pingAndPrint('play.minewind.com');
    await _pingAndPrint('play.hoaxmc.com');
    await _pingAndPrint('mc.performium.net');
    await _pingAndPrint('mc.hypixel.net');
    // await _pingAndPrint('skykingdoms.net');
    await _pingAndPrint('play.skyblocknetwork.com');
    await _pingAndPrint('play.rinaorc.com');
    await _pingAndPrint('play.creativefun.net');
    // await _pingAndPrint('skyblock.net');
    await _pingAndPrint('mc.vanitymc.co');
    await _pingAndPrint('mc.minebox.es');
    // await _pingAndPrint('play.mcprison.com');

    /// Page 3
    await _pingAndPrint('org.AspiriaMc.com');
    // await _pingAndPrint('us.miningdead.com');
    // await _pingAndPrint('play.primemc.org');
    await _pingAndPrint('play.vipermc.net');
    await _pingAndPrint('org.desteria.net');
    // await _pingAndPrint('play.skycade.net');
    await _pingAndPrint('arefy.net');
    await _pingAndPrint('play.opblocks.com');
    await _pingAndPrint('omegacraft.cl');
    await _pingAndPrint('mc.vortexpvp.gg');
    await _pingAndPrint('mso.theseedmc.com');
    await _pingAndPrint('mc.jailbreakmc.com');
    await _pingAndPrint('faithfulmc.com');
    // await _pingAndPrint('mortalmines.com');
    await _pingAndPrint('play.pixelmonrealms.com');
    await _pingAndPrint('Play.pokegalaxia.com');
    await _pingAndPrint('mc.gamesmadeinpola.com');
    await _pingAndPrint('FadeCloud.com');
    await _pingAndPrint('join.mineville.org');
    await _pingAndPrint('play.simplesurvival.gg');

    /// Page 4
    await _pingAndPrint('mc.ventureland.net');
    // await _pingAndPrint('mineverse.com');
    await _pingAndPrint('join.insanitycraft.net');
    await _pingAndPrint('play.becto.net');
    await _pingAndPrint('mc.pvplab.net');
    await _pingAndPrint('play.alttd.com');
    await _pingAndPrint('pokecentral.org');
    await _pingAndPrint('play.pokeverse.org');
    await _pingAndPrint('play.craftadia.com');
    await _pingAndPrint('mc.detox.gg');
    await _pingAndPrint('hub.treemc.net');
    await _pingAndPrint('mc.lotc.co');
    await _pingAndPrint('play.mineraze.net');
    // await _pingAndPrint('mc.arkhamnetwork.org');
    await _pingAndPrint('play.fluxpvp.net');
    await _pingAndPrint('fun.multyplay.ro');
    await _pingAndPrint('mc.beanblockz.com');
    await _pingAndPrint('munchymc.com');
    await _pingAndPrint('play.ham5teak.xyz');
    await _pingAndPrint('play.potterworldmc.com');

    /// Page 5
    await _pingAndPrint('pixel.rc-gamers.com');
    await _pingAndPrint('play.breakdowncraft.com');
    await _pingAndPrint('play.poke-brawl.com');
    await _pingAndPrint('bulk.play-ml.ru');
    await _pingAndPrint('play.pokedash.org');
    await _pingAndPrint('minesaga.org');
    await _pingAndPrint('play.ggmc.me');
    await _pingAndPrint('play.cultivatemc.com');
    await _pingAndPrint('play.mcatlas.net');
    await _pingAndPrint('mc.pvpbulgaria.eu');
    await _pingAndPrint('play.koronakraft.com');
    // await _pingAndPrint('play.MuxMC.net');
    await _pingAndPrint('play.pokerivals.com');
    // await _pingAndPrint('veltpvp.com');
    await _pingAndPrint('play.mc-pgst.tw');
    await _pingAndPrint('Play.RoyalLegacy.Net');
    await _pingAndPrint('bartyrealms.com');
    await _pingAndPrint('play.skyrealms.games');
    await _pingAndPrint('grmpixelmon.com');
    await _pingAndPrint('play.mc-drugs.com');
  }, timeout: Timeout(Duration(minutes: 2)));
}
