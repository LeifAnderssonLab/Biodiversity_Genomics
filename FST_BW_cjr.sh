
module load bioinfo-tools
module load ANGSD/0.940-stable
cd /crex/proj/snic2020-2-19/private/blue_whiting/mapping/

realSFS fst index dosaf_FAROE.saf.idx dosaf_ICE_E.saf.idx -sfs FAROE_ICE_E.ml -fstout here.FAROE_ICE_E.out &
realSFS fst index dosaf_FAROE.saf.idx dosaf_ICE_W.saf.idx -sfs FAROE_ICE_W.ml -fstout here.FAROE_ICE_W.out &
realSFS fst index dosaf_FAROE.saf.idx dosaf_MED.saf.idx -sfs FAROE_MED.ml -fstout here.FAROE_MED.out &
realSFS fst index dosaf_FAROE.saf.idx dosaf_N_SPA.saf.idx -sfs FAROE_N_SPA.ml -fstout here.FAROE_N_SPA.out &
realSFS fst index dosaf_FAROE.saf.idx dosaf_POR_ALG.saf.idx -sfs FAROE_POR_ALG.ml -fstout here.FAROE_POR_ALG.out &
realSFS fst index dosaf_FAROE.saf.idx dosaf_SPA_Cor.saf.idx -sfs FAROE_SPA_Cor.ml -fstout here.FAROE_SPA_Cor.out &
realSFS fst index dosaf_ICE_E.saf.idx dosaf_ICE_W.saf.idx -sfs ICE_E_ICE_W.ml -fstout here.ICE_E_ICE_W.out &
realSFS fst index dosaf_ICE_E.saf.idx dosaf_MED.saf.idx -sfs ICE_E_MED.ml -fstout here.ICE_E_MED.out &
realSFS fst index dosaf_ICE_E.saf.idx dosaf_N_SPA.saf.idx -sfs ICE_E_N_SPA.ml -fstout here.ICE_E_N_SPA.out &
realSFS fst index dosaf_ICE_E.saf.idx dosaf_POR_ALG.saf.idx -sfs ICE_E_POR_ALG.ml -fstout here.ICE_E_POR_ALG.out &
realSFS fst index dosaf_ICE_E.saf.idx dosaf_SPA_Cor.saf.idx -sfs ICE_E_SPA_Cor.ml -fstout here.ICE_E_SPA_Cor.out &
realSFS fst index dosaf_ICE_W.saf.idx dosaf_MED.saf.idx -sfs ICE_W_MED.ml -fstout here.ICE_W_MED.out &
realSFS fst index dosaf_ICE_W.saf.idx dosaf_N_SPA.saf.idx -sfs ICE_W_N_SPA.ml -fstout here.ICE_W_N_SPA.out &
realSFS fst index dosaf_ICE_W.saf.idx dosaf_POR_ALG.saf.idx -sfs ICE_W_POR_ALG.ml -fstout here.ICE_W_POR_ALG.out &
realSFS fst index dosaf_ICE_W.saf.idx dosaf_SPA_Cor.saf.idx -sfs ICE_W_SPA_Cor.ml -fstout here.ICE_W_SPA_Cor.out &
realSFS fst index dosaf_N_SPA.saf.idx dosaf_MED.saf.idx -sfs N_SPA_MED.ml -fstout here.N_SPA_MED.out &
wait
realSFS fst index dosaf_N_SPA.saf.idx dosaf_POR_ALG.saf.idx -sfs N_SPA_POR_ALG.ml -fstout here.N_SPA_POR_ALG.out &
realSFS fst index dosaf_N_SPA.saf.idx dosaf_SPA_Cor.saf.idx -sfs N_SPA_SPA_Cor.ml -fstout here.N_SPA_SPA_Cor.out &
realSFS fst index dosaf_POR_ALG.saf.idx dosaf_MED.saf.idx -sfs POR_ALG_MED.ml -fstout here.POR_ALG_MED.out &
realSFS fst index dosaf_SE_IRE.saf.idx dosaf_FAROE.saf.idx -sfs SE_IRE_FAROE.ml -fstout here.SE_IRE_FAROE.out &
realSFS fst index dosaf_SE_IRE.saf.idx dosaf_ICE_E.saf.idx -sfs SE_IRE_ICE_E.ml -fstout here.SE_IRE_ICE_E.out &
realSFS fst index dosaf_SE_IRE.saf.idx dosaf_ICE_W.saf.idx -sfs SE_IRE_ICE_W.ml -fstout here.SE_IRE_ICE_W.out &
realSFS fst index dosaf_SE_IRE.saf.idx dosaf_MED.saf.idx -sfs SE_IRE_MED.ml -fstout here.SE_IRE_MED.out &
realSFS fst index dosaf_SE_IRE.saf.idx dosaf_N_SPA.saf.idx -sfs SE_IRE_N_SPA.ml -fstout here.SE_IRE_N_SPA.out &
realSFS fst index dosaf_SE_IRE.saf.idx dosaf_POR_ALG.saf.idx -sfs SE_IRE_POR_ALG.ml -fstout here.SE_IRE_POR_ALG.out &
realSFS fst index dosaf_SE_IRE.saf.idx dosaf_SPA_Cor.saf.idx -sfs SE_IRE_SPA_Cor.ml -fstout here.SE_IRE_SPA_Cor.out &
realSFS fst index dosaf_SE_IRE.saf.idx dosaf_W_IRE.saf.idx -sfs SE_IRE_W_IRE.ml -fstout here.SE_IRE_W_IRE.out &
realSFS fst index dosaf_SPA_Cor.saf.idx dosaf_MED.saf.idx -sfs SPA_Cor_MED.ml -fstout here.SPA_Cor_MED.out &
wait
realSFS fst index dosaf_SPA_Cor.saf.idx dosaf_POR_ALG.saf.idx -sfs SPA_Cor_POR_ALG.ml -fstout here.SPA_Cor_POR_ALG.out &
realSFS fst index dosaf_W_IRE.saf.idx dosaf_FAROE.saf.idx -sfs W_IRE_FAROE.ml -fstout here.W_IRE_FAROE.out &
realSFS fst index dosaf_W_IRE.saf.idx dosaf_ICE_E.saf.idx -sfs W_IRE_ICE_E.ml -fstout here.W_IRE_ICE_E.out &
realSFS fst index dosaf_W_IRE.saf.idx dosaf_ICE_W.saf.idx -sfs W_IRE_ICE_W.ml -fstout here.W_IRE_ICE_W.out &
realSFS fst index dosaf_W_IRE.saf.idx dosaf_MED.saf.idx -sfs W_IRE_MED.ml -fstout here.W_IRE_MED.out &
realSFS fst index dosaf_W_IRE.saf.idx dosaf_N_SPA.saf.idx -sfs W_IRE_N_SPA.ml -fstout here.W_IRE_N_SPA.out &
realSFS fst index dosaf_W_IRE.saf.idx dosaf_POR_ALG.saf.idx -sfs W_IRE_POR_ALG.ml -fstout here.W_IRE_POR_ALG.out &
realSFS fst index dosaf_W_IRE.saf.idx dosaf_SPA_Cor.saf.idx -sfs W_IRE_SPA_Cor.ml -fstout here.W_IRE_SPA_Cor.out &
wait
echo "FAROE_ICE_E.out" > Global_fst.txt &&
realSFS fst stats here.FAROE_ICE_E.out.fst.idx >>Global_fst.txt &&
echo "FAROE_ICE_W.out" >> Global_fst.txt &&
realSFS fst stats here.FAROE_ICE_W.out.fst.idx >>Global_fst.txt &&
echo "FAROE_MED.out" >> Global_fst.txt &&
realSFS fst stats here.FAROE_MED.out.fst.idx >>Global_fst.txt &&
echo "FAROE_N_SPA.out" >> Global_fst.txt &&
realSFS fst stats here.FAROE_N_SPA.out.fst.idx >>Global_fst.txt &&
echo "FAROE_POR_ALG.out" >> Global_fst.txt &&
realSFS fst stats here.FAROE_POR_ALG.out.fst.idx >>Global_fst.txt &&
echo "FAROE_SPA_Cor.out" >> Global_fst.txt &&
realSFS fst stats here.FAROE_SPA_Cor.out.fst.idx >>Global_fst.txt &&
echo "ICE_E_ICE_W.out" >> Global_fst.txt &&
realSFS fst stats here.ICE_E_ICE_W.out.fst.idx >>Global_fst.txt &&
echo "ICE_E_MED.out" >> Global_fst.txt &&
realSFS fst stats here.ICE_E_MED.out.fst.idx >>Global_fst.txt &&
echo "ICE_E_N_SPA.out" >> Global_fst.txt &&
realSFS fst stats here.ICE_E_N_SPA.out.fst.idx >>Global_fst.txt &&
echo "ICE_E_POR_ALG.out" >> Global_fst.txt &&
realSFS fst stats here.ICE_E_POR_ALG.out.fst.idx >>Global_fst.txt &&
echo "ICE_E_SPA_Cor.out" >> Global_fst.txt &&
realSFS fst stats here.ICE_E_SPA_Cor.out.fst.idx >>Global_fst.txt &&
echo "ICE_W_MED.out" >> Global_fst.txt &&
realSFS fst stats here.ICE_W_MED.out.fst.idx >>Global_fst.txt &&
echo "ICE_W_N_SPA.out" >> Global_fst.txt &&
realSFS fst stats here.ICE_W_N_SPA.out.fst.idx >>Global_fst.txt &&
echo "ICE_W_POR_ALG.out" >> Global_fst.txt &&
realSFS fst stats here.ICE_W_POR_ALG.out.fst.idx >>Global_fst.txt &&
echo "ICE_W_SPA_Cor.out" >> Global_fst.txt &&
realSFS fst stats here.ICE_W_SPA_Cor.out.fst.idx >>Global_fst.txt &&
echo "N_SPA_MED.out" >> Global_fst.txt &&
realSFS fst stats here.N_SPA_MED.out.fst.idx >>Global_fst.txt &&
echo "N_SPA_POR_ALG.out" >> Global_fst.txt &&
realSFS fst stats here.N_SPA_POR_ALG.out.fst.idx >>Global_fst.txt &&
echo "N_SPA_SPA_Cor.out" >> Global_fst.txt &&
realSFS fst stats here.N_SPA_SPA_Cor.out.fst.idx >>Global_fst.txt &&
echo "POR_ALG_MED.out" >> Global_fst.txt &&
realSFS fst stats here.POR_ALG_MED.out.fst.idx >>Global_fst.txt &&
echo "SE_IRE_FAROE.out" >> Global_fst.txt &&
realSFS fst stats here.SE_IRE_FAROE.out.fst.idx >>Global_fst.txt &&
echo "SE_IRE_ICE_E.out" >> Global_fst.txt &&
realSFS fst stats here.SE_IRE_ICE_E.out.fst.idx >>Global_fst.txt &&
echo "SE_IRE_ICE_W.out" >> Global_fst.txt &&
realSFS fst stats here.SE_IRE_ICE_W.out.fst.idx >>Global_fst.txt &&
echo "SE_IRE_MED.out" >> Global_fst.txt &&
realSFS fst stats here.SE_IRE_MED.out.fst.idx >>Global_fst.txt &&
echo "SE_IRE_N_SPA.out" >> Global_fst.txt &&
realSFS fst stats here.SE_IRE_N_SPA.out.fst.idx >>Global_fst.txt &&
echo "SE_IRE_POR_ALG.out" >> Global_fst.txt &&
realSFS fst stats here.SE_IRE_POR_ALG.out.fst.idx >>Global_fst.txt &&
echo "SE_IRE_SPA_Cor.out" >> Global_fst.txt &&
realSFS fst stats here.SE_IRE_SPA_Cor.out.fst.idx >>Global_fst.txt &&
echo "SE_IRE_W_IRE.out" >> Global_fst.txt &&
realSFS fst stats here.SE_IRE_W_IRE.out.fst.idx >>Global_fst.txt &&
echo "SPA_Cor_MED.out" >> Global_fst.txt &&
realSFS fst stats here.SPA_Cor_MED.out.fst.idx >>Global_fst.txt &&
echo "SPA_Cor_POR_ALG.out" >> Global_fst.txt &&
realSFS fst stats here.SPA_Cor_POR_ALG.out.fst.idx >>Global_fst.txt &&
echo "W_IRE_FAROE.out" >> Global_fst.txt &&
realSFS fst stats here.W_IRE_FAROE.out.fst.idx >>Global_fst.txt &&
echo "W_IRE_ICE_E.out" >> Global_fst.txt &&
realSFS fst stats here.W_IRE_ICE_E.out.fst.idx >>Global_fst.txt &&
echo "W_IRE_ICE_W.out" >> Global_fst.txt &&
realSFS fst stats here.W_IRE_ICE_W.out.fst.idx >>Global_fst.txt &&
echo "W_IRE_MED.out" >> Global_fst.txt &&
realSFS fst stats here.W_IRE_MED.out.fst.idx >>Global_fst.txt &&
echo "W_IRE_N_SPA.out" >> Global_fst.txt &&
realSFS fst stats here.W_IRE_N_SPA.out.fst.idx >>Global_fst.txt &&
echo "W_IRE_POR_ALG.out" >> Global_fst.txt &&
realSFS fst stats here.W_IRE_POR_ALG.out.fst.idx >>Global_fst.txt &&
echo "W_IRE_SPA_Cor.out" >> Global_fst.txt &&
realSFS fst stats here.W_IRE_SPA_Cor.out.fst.idx >>Global_fst.txt &&
realSFS fst stats2 here.FAROE_ICE_E.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10FAROE_ICE_E.out &
realSFS fst stats2 here.FAROE_ICE_W.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10FAROE_ICE_W.out &
realSFS fst stats2 here.FAROE_MED.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10FAROE_MED.out &
realSFS fst stats2 here.FAROE_N_SPA.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10FAROE_N_SPA.out &
realSFS fst stats2 here.FAROE_POR_ALG.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10FAROE_POR_ALG.out &
realSFS fst stats2 here.FAROE_SPA_Cor.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10FAROE_SPA_Cor.out &
realSFS fst stats2 here.ICE_E_ICE_W.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10ICE_E_ICE_W.out &
realSFS fst stats2 here.ICE_E_MED.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10ICE_E_MED.out &
realSFS fst stats2 here.ICE_E_N_SPA.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10ICE_E_N_SPA.out &
realSFS fst stats2 here.ICE_E_POR_ALG.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10ICE_E_POR_ALG.out &
realSFS fst stats2 here.ICE_E_SPA_Cor.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10ICE_E_SPA_Cor.out &
realSFS fst stats2 here.ICE_W_MED.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10ICE_W_MED.out &
realSFS fst stats2 here.ICE_W_N_SPA.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10ICE_W_N_SPA.out &
realSFS fst stats2 here.ICE_W_POR_ALG.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10ICE_W_POR_ALG.out &
realSFS fst stats2 here.ICE_W_SPA_Cor.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10ICE_W_SPA_Cor.out &
realSFS fst stats2 here.N_SPA_MED.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10N_SPA_MED.out &
wait
realSFS fst stats2 here.N_SPA_POR_ALG.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10N_SPA_POR_ALG.out &
realSFS fst stats2 here.N_SPA_SPA_Cor.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10N_SPA_SPA_Cor.out &
realSFS fst stats2 here.POR_ALG_MED.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10POR_ALG_MED.out &
realSFS fst stats2 here.SE_IRE_FAROE.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10SE_IRE_FAROE.out &
realSFS fst stats2 here.SE_IRE_ICE_E.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10SE_IRE_ICE_E.out &
realSFS fst stats2 here.SE_IRE_ICE_W.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10SE_IRE_ICE_W.out &
realSFS fst stats2 here.SE_IRE_MED.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10SE_IRE_MED.out &
realSFS fst stats2 here.SE_IRE_N_SPA.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10SE_IRE_N_SPA.out &
realSFS fst stats2 here.SE_IRE_POR_ALG.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10SE_IRE_POR_ALG.out &
realSFS fst stats2 here.SE_IRE_SPA_Cor.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10SE_IRE_SPA_Cor.out &
realSFS fst stats2 here.SE_IRE_W_IRE.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10SE_IRE_W_IRE.out &
wait
realSFS fst stats2 here.SPA_Cor_MED.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10SPA_Cor_MED.out &
realSFS fst stats2 here.SPA_Cor_POR_ALG.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10SPA_Cor_POR_ALG.out &
realSFS fst stats2 here.W_IRE_FAROE.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10W_IRE_FAROE.out &
realSFS fst stats2 here.W_IRE_ICE_E.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10W_IRE_ICE_E.out &
realSFS fst stats2 here.W_IRE_ICE_W.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10W_IRE_ICE_W.out &
realSFS fst stats2 here.W_IRE_MED.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10W_IRE_MED.out &
realSFS fst stats2 here.W_IRE_N_SPA.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10W_IRE_N_SPA.out &
realSFS fst stats2 here.W_IRE_POR_ALG.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10W_IRE_POR_ALG.out &
realSFS fst stats2 here.W_IRE_SPA_Cor.out.fst.idx -win 50000 -step 10000 > SLIDINGWIN_50_10W_IRE_SPA_Cor.out &
wait
ls
