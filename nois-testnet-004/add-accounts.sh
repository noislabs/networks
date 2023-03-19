#!/bin/bash

current_timestamp=$(date "+%s") # $(date +%s);
in_3_years_timestamp=$(date -v+3y "+%s") # $(date -d '+3 years' +%s)
in_5_years_timestamp=$(date -v+5y "+%s") # $(date -d '+5 years' +%s)
in_7_years_timestamp=$(date -v+7y "+%s") # $(date -d '+7 years' +%s)
free_amount=20000
ufree_amount=$(expr $free_amount \* 1000000)

validator_addresses=(
    "nois17quau8ah8zdadkyflz0h6ead27n2yjj90v49lf"
    "nois1pm7zfz2z80wyl5clt3dhjduwc93gw7yh33dnwf"
    "nois15kzwgak8upfc498ve80u9zjcd459dj384n663r"
    "nois1au4axasl3agzl9smd9zhqlx5hpg2ezdyx7r2c3"
    "nois1088zdc7lxqvh7mwyv46cr6s3asydvwe2jd2plw"
    "nois1j7fgj7v9nqjg6wfda9paldcxezd8yv4q0tq5yj"
    "nois1xwazl8ftks4gn00y5x3c47auquc62ssu5rms2g"
    "nois1tej5lqkljmnd8mszhkg0aepn5qaltyekcwxeqy"
    "nois104hetrwd96sgj9tjdwpf6wkwflxtmq7nu7eae9"
    "nois10hmy2yhwhqqe8p7ax0hrdt4uxkumlhcfltyh07"
    "nois1vj6ydcqycrxe8lnn8z75pdy52gvr0nzuh9pen3"
    "nois10wxn2lv29yqnw2uf4jf439kwy5ef00qdpcplw7"
    "nois1z8jthusnem2h2qfa43gzv2eqv3zqmwf6s323hk"
    "nois1uwvvx04c99pakexg0ydgqkr2e6f0fcsm57jyrt"
    "nois177arfmywkyk06854q5kgrlw6vhm08p5600nay2"
    "nois14c7k4cvjpsx0vgrdsk9hhcc6qycq20rqeu5a63"
    "nois1g9u6lynujx5r4cn74y0hkknjqkx72s6tupar2r"
    "nois1cd3d6zh2yp0me78r4kwhfyvg6psm5y56ymg2cj"
    "nois1em0rgk80hmvel9vlaqthrvu9avfp0kgwajq398"
    "nois1mmvlk84t25p3n7vn6d8w2jkt5lqet52vpk4xrv"
    "nois1qzpl6zv2n8w4nqszrqsnxa8jzys8u9qxaha67x"
    "nois1u4v6aw9vpzvmcwux9mygc2fkgs64g27gku2ej4"
    "nois15rph43lzyqe2gem93nxxxalxqvqe7gg4q2sk5j"
    "nois1wsrjxq4tnt5sxj6p8v524zj4nf0d776y2rrcz9"
    "nois1njft7renhj5ny0cfmj4pvv9t8zc7ccrph0ncyl"
    "nois19yul78yu9jzay9afsyjgmv0pk0k5rl803agdxj"
    "nois1knljz5pa3uyh7n83e54p6x4u0g3crdjlxqk4dm"
    "nois16af5x850nre0qu8gprux3qhfnaq4k7s7nu8nku"
    "nois1fe7ju873fkknmfrmytaft93y5rlf0xcrptnsuz"
    "nois1j56lgzgtjpc6mnp2q73tat58da52j6nwnasg0e"
    "nois1derp7w6q5pg37j9nuv42fzv7zsdu58ev2hu84w"
    "nois1qjftpa8wuyt2zpe6ll5qu23f6xxjpvk7ffmqce"
    "nois1hlpj3lw7d2shtxqtjwn0y78vq903e48apyxx98"
    "nois19f0w9svr905fhefusyx4z8sf83j6et0g3ramh5"
    "nois1k4epy263g5wuzeu92396lmq8y62jxgce7vrkpm"
    "nois1xmvq9x8mttehk6602smz3zdlcymgxsclx5at5n"
    "nois1uz533k43tuhkwhpgv5g7jev8dyts0q9wa4xn48"
    "nois1enwhnv85g4n99a2kzg8gey22xu6u43l4exqxnp"
    "nois12r4sun4wmqd9vrj039nalup0aj02efpfv3sqwk"
    "nois1jcqxnmtu7d9dl2llty3wsfrky52dffrkrgu7v9"
    "nois1pk9gxn40gxadjassmtpnpl0zdc2wgxhdm270wr"
    "nois155a3dkeqmzjwdfp08wp7yzwvu404l2mtcyd5ft"
    "nois1xt47alla8xrwy4e2r4gv0uey4q9uf2j8u0qfwt"
    "nois1j2p6k6dz8hq0wdusvd0kpm45v259uk8c5v75he"
    "nois1zdc69y6vhmsmgne4vn0fkh2nurtfjk5e4uwk9g"
    "nois1r4dnm99wuv93utu07astefy9n75wa6x5th6y0w"
    "nois14fewxgk259tndya35f9t6q9awxd6xckzduljvu"
    "nois10gzkvkj5q23q5gpk47kftwjvxqhaerxfh2984s"
    "nois1njdqdy7w3ulud5w6unxay4ja7ar97353e8pzad"
    "nois1zkczd5vrcnde6kejuz6455s0guptu8wmjgzxvj"
    "nois165u9tc5yrn6zkstgzntn96tgq84s0xe4gfe54l"
    "nois1n7qzudt5ke4t6zaz4dyyq5wumdakpdhwsxx874"
    "nois1v609zcn05sdkhe5z4u7laugvdqah6326qarp4m"
    "nois1acehft4c0lpnwcvp342u36phws4j0n45egxwl4"
    "nois1qrnl66kmaf276wd0fj2fp6cnnj9gta5zr8fa4n"
    "nois17t766t4vevywq2qpwdz8pgc7ztqlt4vd82jcuf"
    "nois1mp6pmw6qh3ufzwvyx43vvc9suf7j3ja4npd0vn"
    "nois1ymh63hmdpp2ymhgqv24q7d0736yeycn94cgc4k"
    "nois1a33xdqmnpf9cz9lc0f5sdhzq5jmgzfcgcezrmz"
    "nois19epls2gdlllt50s8u9yswcf082ns2qypgywaqc"
    "nois1rjrhem49wz2l8d39x92uz2l9gsp0nr7anx3xg2"
    "nois1k9napk69w23sqseq9ed3gpmswf0fn6gfkrf7ck"
    "nois1japw0qknmdey9p9r9j95qr9pm5wmpupkehaz9j"
    "nois1xxwqq6hgg5e5sd786fmecq0mpxqd7y9qw47rke"
    "nois12a9t6ldqlg0c6gygjh2r7k32fc2x0w52yfvc2f"
    "nois15r3u4crd9vm6as0mhlyrtc4nlrh3q6jupka4zd"
    "nois12x3jq2w4svrzv0mg0xfvyvexjurg734zx25njr"
    "nois1v9pzkdwm9m547em4tjwz8dfav8shu0vx0cjnp3"
    "nois18r09wuucu8qhejt7ujsl2gh7704c65r8eek9hv"
    "nois1epgapw0pea4dz2pmhpneqf7fezkldmcvcd82sz"
    "nois1uklqslvu2dht3jp63np5mqsqu73ckpa4xsx0ty"
    "nois1kwltf5gpu2jljmqkwudn322um6pjwxazcjfs8y"
    "nois1a29m2lcdxdvsmyyxpqv00xc9my9excvsx65qql"
    "nois1twc7geuenvhjqasjpj2ndw95gz0u9y2v5rx7sp"
    "nois1resje48u4mfrxr7xx0euvfnyvxtt98refayrpj"
    "nois120c0gc9uhtg74rseeu0p5f5mu8vefpzf25yfn0"
    "nois1zseghy6r2pa698pu2ecg7qqwe5230taszepx77"
    "nois1wwgrl05jkk3a3m9gm0wwmvq3r0fd93p8vrqzju"
    "nois1cpaadspvhmch4eqqnje8sjagczv9jjqzelkywd"
    "nois122e9h6csqflrfeez8c9dece8k23vxt2dj24yuv"
    "nois1sdz8xuclr7kf7uh4zjz74vrg597050jt838n2r"
    "nois1702vuj7m0xpskc59pdjdv4ntf0pyj7gujrg4tv"
    "nois1lety0u8j0w2rw74wkywc7luhq2q9c9hrp2eq6s"
    "nois1hwg54kyrl5p8p3h26h8z56k07arzh6mruxma7g"
    "nois1cxymlc09tnlnel4etwegphqu08tylqj5vvwxjv"
    "nois1eqj3augdjxt5le5m5zquytlpaj46gfae3xypqn"
    "nois15kywkhdljlkfvvzwkshnquz2x63nrxew2ej93a"
    "nois1y42qp2uzk0s480uswx0f5r4e4rlkkjh6dr040n"
    "nois1guztv648c9khruhsmz8mz8qqghkdd5s0ctyzwx"
    "nois19kzucp809gwek59uz5lvzjfsgyh9gwz27xfw6w"
    "nois1luknjhnmcarptur4dcuvhkd9cw92x2u92l7tzt"
    "nois1ekg5m05w6an4jqs2nf39nejpttrvfkw652zlat"
    "nois1ldx7xtalftfj47q6lysk8ldynk03920pxm23pz"
    "nois1ywe2pw0vjz6cdgfekgg9mcdtmtcnqr897g759r"
    "nois1kntnpagul5gf5c5vzsxyh504d2ztpgfgh5fmhn"
    "nois1gykx5en0543f47yd6m0g69c04ah63zk8px8x7z"
    "nois1jjwhgtf7a60y27slquc52z2efnhlu0wds6sf0m"
    "nois10hcnj06d32khtknfgxkcs05amnw4wrl8w23c8m"
    "nois1qlq3c2pjjha03h7eg4p462m7agum57f5yrlz49"
    "nois1f9dzegez3gyqntlrjy85vdxjp26ckadnk6u4jd"
    "nois13s2drrx3rzykgh2sjnrvvt9tq08a6k65wycjx3"
    "nois1zdwjzmpc923y8gmfkasgndqjl6srf5c7w4cfhv"
    "nois1d3vz6wce55e2tafuys4wadtte9ggdfzk9xy24e"
    "nois1n3rae5ctxq0lxgc2dd6sfu653xg0jmre5s6aml"
    "nois1xf0ls3hxqgya5ymv25n2hdsqfas7h89mr0uemw"
    "nois1lkj7c7020yp0y63ngham35ewrmcqjvdyfvdhxh"
    "nois1m36h06j0hv33swwze5nhdhccdkek0dw6n28hfu"
    "nois1z8nny6dyww8pgul3rcq4ctjq8j0sm24rk3ldd6"
    "nois172ec2tljt4dhcuc38qc82nquetkshwgmr98scn"
    "nois1v6jjc4jw5eg9ky2skt2zvnntlzjlpwyx72eu7n"
    "nois1vujfft38ggemn4jzxv2z427yl950396jeqx4dw"
    "nois1jfdjursuy3mru5llckmjq4lmrkvqaw3fgu9ss7"
    "nois1zcv66fuznlfjsaehfhllacdj5uvf6nausj4a3l"
    "nois1t4xy4p2nv6yvkjcmq5husxql9jdndp356yjpnu"
    "nois1ptzpqvqz2eqldz5q5cuvcpg9ca2lls90agtthl"
    "nois18gaktzfvxhf5wq0eeymvsf5qm8keuc4dy3kqwn"
    "nois1354v48phwxyrcq49hpdv7d9wamg8k74m0fkfew"
    "nois1er34zm90nlm3xmhwx2zpt4gnzd4htmj2jaa0dk"
    "nois1d76j0j80wwgdfycp9h0f3mnqsx7n0gesfqml78"
    "nois1n84mdm0sqhpjg9ugcfvsfyputdu05yuvepu5dn"
    "nois1s4z8wt477mwev7uewj8qjdfjhnsuujzwn0yrd7"
    "nois1xsctg2vep8gavzu65c469arpg2tuysem3pqagv"
    "nois1gv0d8lyttmtnl2pe64m382p84c98te50q0sffs"
    "nois1eykwyss2rtuhqcqw3gryz52jnfmvpep9kwftnp"
    "nois1fg0fr7w6tnkel6g70m9slduvdmn6fmxetj2afe"
    "nois1l4gudwr60jk3awse85awn9wf762w9afcntntmx"
    "nois1g8rqhyk6ghk5q3qadd6h7vc7vcf5j5jjqfadu8"
    "nois14se490fu0ssckdjq3cswj0ta08d4dt90dkj7j3"
    "nois1zuqs7dcncty8uj3c0pplxd8339mvazvwv852e2"
    "nois1puqskpxs0a09q9c8wkru53mccwvesax0xjkcwh"
    "nois1nvhfqlfnnq8qjxanxvcudypnzqkzvhpc9anvsq"
    "nois1ruckvyjdwfqvpe8jgu9a9cstlqmzt85qcxt77c"
    "nois1eywwsw24l6fw29xuluhz9ty5dj8t2nyavmrmjq"
    "nois1wdatlgulayj52gyukp9y3nj3fgwfnkgpapdxdn"
    "nois1fnfwprtjc6x4tk5u4fsnglr6e4n5fs9wt7mmcz"
    "nois1e0lvgjx4xspw358rfypmp297szupedu0mj6mtu"
    "nois1elpkzcjueh55lkf7ldw58qhay8ak22xyw0crgv"
    "nois1he6w66evpp5k85yz3wsw9le9m85e2y5tur7pvd"
    "nois1q02qt5dhwfgeth9hptnlh6jal6yldkafv8gmzn"
    "nois1llkf6x237xadn7sqlscqgpg4e79xcwl4k7rnr0"
    "nois1yzks5wlu8dpg9sf0c3uwz6txrwx27qy9wmwx28"
    "nois1kmf9w8nmvsuaps2kf4smhphnj8unjcaksh2rah"
    "nois1s73qd7x30mu800y0lu5y0lw68lx2623gp2ckzh"
    "nois12mkpagr84ercfl6jx5e6ckw34ppyqckzppshc5"
    "nois1q3xtgy3t5zh44gc3dhqjh65jk7le2quy8hc7at"
    "nois1ljvdlhws6j5md5srpy7jdrxpuhpx2k7wy80v8g"
    "nois14pwtxds7y72ph2f7gx65wvuxznr24eap8drh5m"
    "nois1d0pzh0ysr3kc7a49kk5lsxlaj3p3wfrc8wpaxv"
    "nois1gjtvly9lel6zskvwtvlg5vhwpu9c9waw2v0awd"
    "nois1cd00477kc8yxny77rs7jpspw8uvczclmyn0tkf" 
    "nois1qx0wpjh9xudc85phuzu455c895yz9w0eutwn8j"
    "nois1chlldrmwmm9v9aw7azy5ug3plale47hm00f6d9" 
    "nois1sqtzwhetv5az4e9vvmpvuew479ar70l3rqu94q" 
    "nois1g6rfmu0gcc3avke35c9wemu8f0kxdrvnz4wgqt" 
    "nois1nevy9pek8fjn7c3fja5pfjakwudx4v5f86a782"
    "nois1g40rlulkjngw8fpe6f079vw80ykgskt0j4udcr"
    "nois1zt338fp758c6hlnma54a7vc076ltz48l72t7fp"
)

# Early validators
account_balance=20000 #0.01%
uaccount_balance=$(expr $account_balance \* 1000000)
for validator_address in "${validator_addresses[@]}"
do
    noisd add-genesis-account "$validator_address" "$uaccount_balance"unois
done

# 7 year vesting
account_balance=10000000 #5%
uaccount_balance=$(expr $account_balance \* 1000000)
noisd add-genesis-account nois10cnf56nhfzsddg0qmvc7p3kfrt9l43f6hheqc8 "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_7_years_timestamp
noisd add-genesis-account nois1wrcs6v5d4772ajwaf5c5kp275e9h82vcvpnzfa "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_7_years_timestamp

# 5 year vesting
account_balance=3000000 #1.5%
uaccount_balance=$(expr $account_balance \* 1000000)
noisd add-genesis-account nois128tdu0w2ga9wh9nyy9j5dmz5q7ed4qk8zaqcmv "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_5_years_timestamp 
noisd add-genesis-account nois1hw4ctf2tm8j9avy3vjchxcpew4mhhj8m5zt9xn "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_5_years_timestamp 

# 3 year vesting
account_balance=200000 #0.1% 
uaccount_balance=$(expr $account_balance \* 1000000)
noisd add-genesis-account nois1av86gm7rnsgq6vsvf09z4nkae235cvg0fe554j "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_3_years_timestamp 
noisd add-genesis-account nois16e7gnczk2jv20gdzqmfxgrxuwdty6g36t42mv2 "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_3_years_timestamp 
noisd add-genesis-account nois17dn5e2n6w60pzyxeq79apr05r6jzfw7ws8e9lr "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_3_years_timestamp 
noisd add-genesis-account nois1kaq7tw7y8lsr7etjglfc4n5yc68fzyvlxpcf6w "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_3_years_timestamp  
noisd add-genesis-account nois1qt9xm0yml93ltf8rg0q7pylgzgkyxrtuj6nvzs "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_3_years_timestamp 

account_balance=220000 #0.11% 
uaccount_balance=$(expr $account_balance \* 1000000)
noisd add-genesis-account nois1ua2qf3vfu5v4f547ndvze0jptm3zxl8rwtll0k  "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_3_years_timestamp  
noisd add-genesis-account nois140l6y2gp3gxvay6qtn70re7z2s0gn57za3ww2e  "$uaccount_balance"unois --vesting-amount $((uaccount_balance - ufree_amount))unois --vesting-start-time $current_timestamp --vesting-end-time $in_3_years_timestamp 
