# LaunchImage

The nine-square mark, on the theme's ground, in light and dark.

**Do not edit these by hand.** They are rendered from the same widget the splash uses, by
`apps/tic_tac_toe/test/golden/launch_image_test.dart` — `mise run goldens-update` writes them and
`mise run goldens` fails if the shipped image and the mark have parted company.

The storyboard centres the image in the window, and `SplashScreen` centres the mark on the
screen, so the mark does not move when Flutter takes over.
