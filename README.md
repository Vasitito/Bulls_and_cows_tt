![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test.yaml/badge.svg)

  # Bulls and cows

  

This repository contains the implementation of the game bulls and cows. The bulls and cows is a game where the users try to discover the exact pattern of secret numbers. The logic diagram of the hardware implementation of the game is represented below

  <p align="center">
  <img src=./figures/figure1.png>
  </p>
  <p align = "center">
      <b>Figure 1:</b> The logic diagram of the bulls and cows game
  </p>

  # How to play

  Firstly, a secret pattern of four 3-bit numbers, which are different with each other, should be set. This is done through the save signal. After the secret number is set, another user tries to find the correct pattern of numbers. In order for the correct pattern to be found, the signals of cows and bulls are pinpointing as to whether the user input had any match with the secret pattern. The cows indication shows as to whether the input matches with any secret number but it is not in the right position. On the other hand, the cows indication shows as to whether the input matches and is placed correctly. The purpose of the game is for the user to achieve four bulls indications. For the signals of bulls and cows the indications are showed through the seven segment display. In the seven segment display the bulls indication is placed in the top region (0-1-5-6) and the cows indication is placed in the bottom region (2-3-4-7) of the seven segment display.

  # An example of the game

  | Secret number |  Input  |  Bulls  |  Cows   |
  | :-----------: | :-----: | :-----: | :-----: |
  |    3-7-1-2    | 7-1-2-3 | 0-0-0-0 | 1-1-1-1 |
  |    3-7-1-2    | 3-7-1-2 | 1-1-1-1 | 0-0-0-0 |
  |    3-7-1-2    | 3-1-7-2 | 1-0-0-1 | 0-1-1-0 |
  |    3-7-1-2    | 6-7-1-2 | 1-1-1-0 | 0-0-0-0 |
  |    3-7-1-2    | 5-6-0-4 | 0-0-0-0 | 0-0-0-0 |

  

  # Interface

  |  Signals   | Tiny Tapeout 4 signals |
  | :--------: | :--------------------: |
  |    In1     |       ui_in[2:0]       |
  |    In2     |       ui_in[5:3]       |
  |    In3     |      uio_in[2:0]       |
  |    In4     |      uio_in[5:3]       |
  |    save    |        ui_in[6]        |
  |  bulls[0]  |       uo_out[5]        |
  | bulls[2:1] |      uo_out[1:0]       |
  |  bulls[3]  |       uo_out[6]        |
  | cows[2:0]  |      uo_out[4:2]       |
  |  cows[3]   |       uo_out[7]        |
