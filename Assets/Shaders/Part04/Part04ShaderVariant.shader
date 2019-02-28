Shader "ShaderStudy/Part04/SurfaceShaderVariant"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;


        void surf (Input IN, inout SurfaceOutputStandard o)
        {

            // float4 test = float4(1,0,0,1);
            float r = 1;
            float2 gg = float2(0.5, 0);
            float3 bbb = float3(1,0,1);
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            // o.Albedo = test.rgb;
            // o.Albedo = test.grb;
            // o.Albedo = test.bgr;

            //변수 부분값 활용
            // o.Albedo = float3(r,0,0);
            // o.Albedo = float3(0,gg);
            o.Albedo = float3(bbb.b, gg.r, r.r);
            // o.Albedo = float3(1, 0.5, 1);
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
