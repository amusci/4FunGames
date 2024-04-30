using UnityEngine;

public class AudioManager : MonoBehaviour
{
    [Header("---------- Audio Source ----------")]
    [SerializeField] AudioSource musicSource;
    [SerializeField] AudioSource SFXsource;

    [Header("---------- Audio Clip ----------")]
    public AudioClip background;
    public AudioClip finish;
    public AudioClip death;

}
