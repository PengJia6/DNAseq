include: "var_gatk_HC.smk"
include: "var_freebayes.smk"
include: "var_bcftools.smk"
include: "var_varscan.smk"
include: "var_delly.smk"
include: "var_lumpy.smk"
include: "var_smoove.smk"
include: "var_cnvnator.smk"
include: "var_breakdancer.smk"
include: "var_manta.smk"
include: "var_cnvkit.smk"
include: "var_cnvcaller.smk"

rule tabix:
    input:
         "{prefix}.vcf.gz"
    output:
          "{prefix}.vcf.gz.tbi"
    run:
        shell("{path_tabix}tabix -f {input} ")

path_raw_vcf = []
if "HC" in config["pipe"]["snpindel"]:
    # single sample calling
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/HC/perSample/{bam_sample}/{bam_sample}.HC.raw.vcf.gz.tbi".format(bam_sample=i))
if "HC_Hard_filter" in config["pipe"]["snpindel"]:
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/HC/perSample/{bam_sample}/{bam_sample}.HC.SNV.passh.vcf.gz.tbi".format(bam_sample=i))
        path_raw_vcf.append(
            path_data + "germlineVar/HC/perSample/{bam_sample}/{bam_sample}.HC.INDEL.passh.vcf.gz.tbi".format(bam_sample=i))
if "HC_VQSR" in config["pipe"]["snpindel"]:
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/HC/perSample/{bam_sample}/{bam_sample}.HC.SNV.VQSR.vcf.gz.tbi".format(bam_sample=i))
        path_raw_vcf.append(
            path_data + "germlineVar/HC/perSample/{bam_sample}/{bam_sample}.HC.INDEL.VQSR.vcf.gz.tbi".format(bam_sample=i))

if "HC_Joint" in config["pipe"]["snpindel"]:
    # joint calling
    path_raw_vcf.append(
        path_data + "germlineVar/HC/jointCall/jointCall/" + config["project"]["name"] + ".HC.raw.vcf.gz.tbi")

if "HC_Jonit_Hard_filter" in config["pipe"]["snpindel"]:
    path_raw_vcf.append(
        path_data + "germlineVar/HC/jointCall/jointCall/" + config["project"]["name"] + ".HC.SNV.passh.vcf.gz.tbi")
    path_raw_vcf.append(
        path_data + "germlineVar/HC/jointCall/jointCall/" + config["project"]["name"] + ".HC.INDEL.passh.vcf.gz.tbi")

if "HC_Joint_VQSR" in config["pipe"]["snpindel"]:
    path_raw_vcf.append(
        path_data + "germlineVar/HC/jointCall/jointCall/" + config["project"]["name"] + ".HC.SNV.VQSR.vcf.gz.tbi")
    path_raw_vcf.append(
        path_data + "germlineVar/HC/jointCall/jointCall/" + config["project"]["name"] + ".HC.INDEL.VQSR.vcf.gz.tbi")

if "freebayes" in config["pipe"]["snpindel"]:
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/FB/perSample/{bam_sample}/{bam_sample}.FB.raw.vcf.gz.tbi".format(bam_sample=i))
        path_raw_vcf.append(
            path_data + "germlineVar/FB/perSample/{bam_sample}/{bam_sample}.FB.pass.vcf.gz.tbi".format(bam_sample=i))
if "bcftools" in config["pipe"]["snpindel"]:
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/Bcftools/perSample/{bam_sample}/{bam_sample}.Bcftools.raw.vcf.gz.tbi".format(
                bam_sample=i))
        path_raw_vcf.append(
            path_data + "germlineVar/Bcftools/perSample/{bam_sample}/{bam_sample}.Bcftools.pass.vcf.gz.tbi".format(
                bam_sample=i))
if "varscan" in config["pipe"]["snpindel"]:
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/varscan/perSample/{bam_sample}/{bam_sample}.varscan.raw.vcf.gz.tbi".format(
                bam_sample=i))
        path_raw_vcf.append(
            path_data + "germlineVar/varscan/perSample/{bam_sample}/{bam_sample}.varscan.pass.vcf.gz.tbi".format(
                bam_sample=i))
        path_raw_vcf.append(
            path_data + "germlineVar/varscan/perSample/{bam_sample}/{bam_sample}.varscan.SNV.pass.vcf.gz.tbi".format(
                bam_sample=i))
        path_raw_vcf.append(
            path_data + "germlineVar/varscan/perSample/{bam_sample}/{bam_sample}.varscan.INDEL.pass.vcf.gz.tbi".format(
                bam_sample=i))

if "delly" in config["pipe"]["svcnv"]:
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/delly/perSample/{bam_sample}/{bam_sample}.delly.raw.vcf.gz.tbi".format(
                bam_sample=i))
#
# if "lumpy" in config["pipe"]["svcnv"]:
#     for i in bam_sample_list:
#         path_raw_vcf.append(
#             path_data + "germlineVar/lumpy/perSample/{bam_sample}/{bam_sample}.lumpy.raw.vcf".format(
#                 bam_sample=i))


#
if "smoove" in config["pipe"]["svcnv"]:
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/smoove/perSample/{bam_sample}/{bam_sample}.smoove.raw.vcf.gz.tbi".format(
                bam_sample=i))
if "cnvnator" in config["pipe"]["svcnv"]:
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/cnvnator/perSample/{bam_sample}/{bam_sample}.raw.cnvnator".format(
                bam_sample=i))
if "breakdancer" in config["pipe"]["svcnv"]:
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/breakdancer/perSample/{bam_sample}/{bam_sample}.raw.breakdancer".format(
                bam_sample=i))
if "manta" in config["pipe"]["svcnv"]:
    for i in bam_sample_list:
        path_raw_vcf.append(
            path_data + "germlineVar/manta/perSample/{bam_sample}/{bam_sample}_manta.raw.vcf.gz.tbi".format(
                bam_sample=i))
# if "manta" in config["pipe"]["svcnv"]:
#     for i in bam_sample_list:
#         path_raw_vcf.append(
#             path_data + "germlineVar/manta/perSample/{bam_sample}/{bam_sample}_manta.raw.vcf.gz.tbi".format(
#                 bam_sample=i))


