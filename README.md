# EDuke32 - Custom Gameplay Fork

This project is based on the [official EDuke32 repository](https://voidpoint.io/terminx/eduke32).

It adds custom cheats and gameplay improvements to Duke Nukem 3D while preserving the original game experience.

## Building and Running

Place an original `DUKE3D.GRP` file in the project root directory.

Build the game without the GTK2 interface, optimized for the local CPU:

```sh
./build.sh
```

This is equivalent to:

```sh
gmake -j$(nproc) HAVE_GTK2=0 OPTOPT="-march=native"
```

`-march=native` enables every instruction set extension supported by the build machine (SSE4, AVX, AVX2, FMA, AVX-512, ...), so the resulting binary may not run on other CPUs. Without `OPTOPT`, the upstream default for x86_64 is `-march=core2` (SSE3 only).

To use different flags, set `OPTOPT` when calling the script, for example `OPTOPT="-march=x86-64-v3" ./build.sh`. Make does not track compiler flag changes, so run `make clean` before rebuilding with different flags.

Run the game using SDL's X11 video driver:

```sh
SDL_VIDEODRIVER=x11 ./eduke32
```

The build command uses all available CPU cores.

## Custom Cheats

During a game, type the complete code directly on the keyboard. Entering a toggle cheat again disables its effect.

| Code | Type | Effect |
| --- | --- | --- |
| `dnammo` | Toggle | Enables infinite ammo and replenishes the available weapon ammunition. |
| `dnmagnet` | One-shot action | Immediately spawns monsters waiting on map triggers and teleports all living enemies close to Duke. Sleeping monsters are awakened as well. |
| `dnfastweapons` | Toggle | Speeds up weapon firing and recovery. The pipebomb keeps its original timing so holding the fire button still controls throwing strength and distance. |
| `dnregen` | Toggle | Restores 1 health point every 3 seconds, up to the normal maximum health. |
| `dnboom` | Toggle | Makes pistol, shotgun, and chaingun impacts produce small explosions with area damage. Duke can also be hurt when standing close to an impact. |
| `dnberserk` | Toggle | Greatly increases Mighty Foot and Quick Kick damage. Minimum damage matches Duke's configured maximum health, and the effect stacks with steroids. |

All cheats, including the original Duke Nukem 3D cheats, can be used on the **Damn I'm Good** difficulty.

### Useful Combinations

- `dnfastweapons` + `dnberserk`: extremely fast and powerful kicks.
- `dnfastweapons` + `dnammo`: accelerated firing without consuming ammunition.
- `dnboom` + `dnfastweapons`: a large volume of explosions; be careful with damage close to the player.

## Monsters on the Automap

Open the automap using the key assigned to **Map** - `Tab` by default.

The full automap highlights every living monster with a red arrow, including monsters that are:

- in sectors that have not been visited yet;
- sleeping;
- frozen;
- waiting for or performing a map action.

Dead monsters and invisible sprites are not displayed. This feature is independent of `dnmagnet` and remains available during normal gameplay.

## Secret Areas on the Automap

The automap also outlines every secret area that has not been found yet in yellow, with a yellow cross at its center so small secrets stay visible when zoomed out. Secret areas are shown even in sectors that have not been visited.

Once Duke enters a secret area and the "secret place found" message appears, that area disappears from the map, so the yellow outlines always show the secrets still missing on the current level.

## Notes

- The custom changes are intended primarily for single-player games.
- **Damn I'm Good** keeps its original gameplay behavior, with cheats enabled.
- `dnmagnet` can bring forward monsters that would normally spawn only after a map trigger.
- `dnboom` can damage objects, enemies, and the player within the explosion radius.
- Original Duke Nukem 3D game data is not included and must be supplied by the player.
