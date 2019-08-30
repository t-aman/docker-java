# 概要

#### Dockerイメージ（java）

    Java 8 (CentOS) が動作するDockerfileです。

#### 動作環境

    Docker環境で実行します。

# 利用方法

#### Dockerfile から起動する場合
    - 1.ビルド
        $ docker build -t jdk 【Dockerfileのパス】
        
        例）
        $ docker build -t jdk d:/work/docker-java/
    
    - 2.コンテナ起動
        $ docker run --name java -it jdk /bin/bash

        補足）ホスト側ファイルを利用する場合　※≪その他≫参照
        $ docker run -v //d/docker-java:/var/java/ --name java -it jdk /bin/bash

    - 3.動作確認
        $ javac Main.java && java Main

    - 4.コンテナ停止
        $ docker rm -f www

#### 公開イメージから起動する場合
    - 1.コンテナ起動
        $ docker run --name java -it nasca/jdk /bin/bash

        補足）ホスト側ファイルを利用する場合　※≪その他≫参照
        $ docker run -v //d/docker-java:/var/java/ --name java -it nasca/jdk /bin/bash

    - 2.動作確認
        $ javac Main.java && java Main

    - 3.コンテナ停止
        $ docker rm -f www


# その他

#### 共有フォルダをコンテナから利用する場合

    $ docker run -v 【ホスト共有フォルダ】:/var/java/ --name java -it jdk /bin/bash

    例）
    $ docker run -v //d/docker-java:/var/java/ --name java -it jdk /bin/bash

#### 共有フォルダの作成方法

    1. 仮想マシンの設定で共有フォルダの設定
    | ホストOS | ゲストOS定義 | 
    | D:\WORK | D_DRIVE |

    2. Dockerで設定
    $ docker-machine ssh default 'sudo mkdir -p /d'
    $ docker-machine ssh default 'sudo mount -t vboxsf -o uid=0,gid=0 D_DRIVE /d'

    「D:\WORK\docker-php」が利用可能になる
