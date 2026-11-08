interface UserAvatarProps {
  name: string;
  avatarUrl: string | null;
  size?: 'sm' | 'lg';
}

/** 用户头像：有图片时展示图片，否则展示名称首字 */
export function UserAvatar({ name, avatarUrl, size = 'sm' }: UserAvatarProps) {
  const box = size === 'lg' ? 'h-16 w-16 text-headline-sm' : 'h-9 w-9 text-label-md';
  if (avatarUrl) {
    return <img src={avatarUrl} alt="" className={`${box} shrink-0 rounded-full object-cover`} />;
  }
  return (
    <span
      className={`${box} flex shrink-0 items-center justify-center rounded-full bg-primary-container font-semibold text-on-primary-container`}
      aria-hidden="true"
    >
      {name.charAt(0).toUpperCase()}
    </span>
  );
}
